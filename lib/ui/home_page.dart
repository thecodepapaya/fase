import 'package:fase/globals.dart';
import 'package:fase/models/faculty.dart';
import 'package:fase/models/registration_data.dart';
import 'package:fase/models/student.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/styles.dart';
import 'package:fase/ui/student/course_page.dart';
import 'package:fase/utils/api.dart';
import 'package:fase/utils/location_permission.dart';
import 'package:fase/utils/startup_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  static const route = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StartupCheck _checks = StartupCheck();
  bool _isloading = true;
  bool _allCheckPass = false;

  @override
  void initState() {
    super.initState();
    LocationPermission(context)
        .requestPermisson()
        .then((value) => performChecks());
  }

  void performChecks() async {
    setState(() {
      _isloading = true;
    });
    _allCheckPass = await _checks.check();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.systemCheck),
        leading: Icon(
          Globals.isFaculty ? Icons.person : Icons.person_outline_outlined,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _isloading ? CircularProgressIndicator() : _checkResult(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          performChecks();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _checkResult() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _table(),
          SizedBox(height: 50),
          _buttom(_allCheckPass, _checks.lastCheckIsRegistrationValid),
        ],
      ),
    );
  }

  Widget _table() {
    return Table(
      children: <TableRow>[
        _tableRow(
          StringResources.physicalDevice,
          _checkIcon(_checks.lastCheckIsPhysicalDevice),
        ),
        _tableRow(
          StringResources.isUnRooted,
          _checkIcon(!_checks.lastCheckIsRooted),
        ),
        _tableRow(
          StringResources.locationGranted,
          _checkIcon(_checks.lastCheckIsLocationGranted),
        ),
        _tableRow(
          StringResources.locationEnabled,
          _checkIcon(_checks.lastCheckIsLocationEnabled),
        ),
        _tableRow(
          StringResources.wifiConnected,
          _checkIcon(_checks.lastCheckIsWifiConnected),
        ),
        _tableRow(
          StringResources.iiitvWifiConnected,
          _checkIcon(_checks.lastCheckIsIIITVConnected),
        ),
        _tableRow(
          StringResources.pingServer,
          _checkIcon(_checks.lastCheckCanPing),
        ),
        _tableRow(
          StringResources.uptoDateVersion,
          _checkIcon(_checks.lastCheckIsMinVersion),
        ),
        _tableRow(
          StringResources.registratonValid,
          _checkIcon(_checks.lastCheckIsRegistrationValid),
        ),
      ],
    );
  }

  TableRow _tableRow(String key, Widget icon) {
    return TableRow(
      children: <Widget>[
        Text(key, style: Styles.heading2),
        icon,
      ],
    );
  }

  Widget _checkIcon(bool correct) {
    if (correct)
      return Icon(Icons.check_circle_outline_rounded, color: Colors.green);
    else
      return Icon(Icons.error_outline_rounded, color: Colors.red);
  }

  Widget _buttom(bool allCheckPass, bool registrationValid) {
    String displayText;
    Widget button;
    if (!allCheckPass) {
      displayText = StringResources.someChecksFailed;
      button = Container();
    } else {
      if (registrationValid) {
        displayText = StringResources.allCheckPass;
        button = ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringResources.proceed),
            ],
          ),
          onPressed: () {
            if (Globals.isFaculty) {
              print('hello');
            } else {
              Navigator.of(context).pushNamed(StudentCoursePage.route);
            }
          },
        );
      } else {
        displayText = StringResources.registrationPending;
        button = ElevatedButton(
          child: Text(StringResources.register),
          onPressed: () async {
            await Globals.initialize();
            User user = FirebaseAuth.instance.currentUser;
            Globals.isFaculty
                ? await facultyRegistration(user)
                : await studentRegistration(user);
            Fluttertoast.showToast(msg: StringResources.success);
            performChecks();
          },
        );
      }
    }
    return Column(
      children: [
        Text(displayText, style: Styles.heading),
        SizedBox(height: 50),
        button,
      ],
    );
  }

  Future<void> studentRegistration(User user) async {
    Registration registrationData = Registration(
      student: Student(
        instituteEmail: user.email,
        googleUid: user.uid,
        name: user.displayName,
      ),
      deviceId: Globals.androidId,
      isPhysical: Globals.isPhysicalDevice,
      isRooted: Globals.isRooted,
      fingerprint: Globals.fingerprint,
      sdkInt: Globals.sdk,
      appVersionString: Globals.version,
      appBuildNumber: Globals.buildNumber,
      ssid: Globals.wifiName,
      bssid: Globals.wifiBSSID,
      localIp: Globals.wifiLocalIP,
    );
    Registration registration =
        await RegistrationAPi.postRegistration(registrationData);
    await Globals.secureStorage.write(
      key: StringResources.serverKey,
      value: registration.serverKey,
    );
  }

  Future<void> facultyRegistration(User user) async {
    Faculty faculty = Faculty(
      instituteEmail: user.email,
      googleUid: user.uid,
      name: user.displayName,
    );
    String accessToken = await FacultyApi.postFaculty(faculty);
    await Globals.secureStorage.write(
      key: StringResources.accessToken,
      value: accessToken,
    );
  }
}
