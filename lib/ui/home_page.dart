import 'package:fase/globals.dart';
import 'package:fase/models/registration_data.dart';
import 'package:fase/models/student_data.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/api.dart';
import 'package:fase/utils/location_permission.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LocationPermission(context).requestPermisson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.fase),
        actions: [_getIcon()],
      ),
      body: Center(
        child: FutureBuilder<bool>(
          future:
              Globals.secureStorage.containsKey(key: StringResources.serverKey),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) return Text("Registered");
            }
            return _register();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: Icon(Icons.wifi),
      ),
    );
  }

  Widget _register() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(StringResources.registerPrompt),
        SizedBox(height: 20),
        ElevatedButton(
          child: Text(StringResources.register),
          onPressed: () async {
            // Necessary since it's initialized first time before accessing
            // location permissions
            await Globals.initialize();
            Registration registrationData = Registration(
              studentData: StudentData(
                instituteEmail: FirebaseAuth.instance.currentUser.email,
                googleUid: FirebaseAuth.instance.currentUser.uid,
                name: FirebaseAuth.instance.currentUser.displayName,
              ),
              deviceId: Globals.androidId,
              isPhysical: Globals.isPhysicalDevice,
              isRooted: Globals.isRooted,
              fingerprint: Globals.fingerprint,
              sdkInt: Globals.sdk,
              appVersionString: Globals.version,
              appBuildNumber: Globals.buildNumber,
              ssid: Globals.wifiName ?? 'no-wifi-ssid',
              bssid: Globals.wifiBSSID ?? 'no-bssid',
              localIp: Globals.wifiIP ?? 'no-local-ip',
            );
            Registration registration =
                await RegistrationAPi.postRegistration(registrationData);
            setState(() {
              Globals.secureStorage.write(
                  key: StringResources.serverKey,
                  value: registration.serverKey);
            });
          },
        ),
      ],
    );
  }

  IconButton _getIcon() {
    if (!Globals.isPhysicalDevice) {
      return IconButton(
          icon: Icon(Icons.error, color: Colors.red),
          onPressed: () {
            dialog(StringResources.error, StringResources.emulatorDetected);
          });
    } else if (Globals.isRooted) {
      return IconButton(
          icon: Icon(Icons.warning, color: Colors.yellow),
          onPressed: () {
            dialog(StringResources.warning, StringResources.rootDetected);
          });
    } else {
      return IconButton(
        icon: Icon(Icons.check_circle_rounded, color: Colors.green),
        onPressed: () {
          dialog(StringResources.allGood, StringResources.trustable);
        },
      );
    }
  }

  Future dialog(String title, String body) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(StringResources.ok),
            )
          ],
        );
      },
    );
  }
}
