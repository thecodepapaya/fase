import 'package:fase/globals.dart';
import 'package:fase/models/attendance_data.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/student.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/styles.dart';
import 'package:fase/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentCoursePage extends StatefulWidget {
  static const route = '/CoursePage';

  @override
  _StudentCoursePageState createState() => _StudentCoursePageState();
}

class _StudentCoursePageState extends State<StudentCoursePage> {
  List<Course> courses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() async {
    setState(() {
      _isLoading = true;
    });
    courses = await CourseApi.getCourses();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.activeAttendances),
        actions: [
          Globals.isRooted
              ? IconButton(
                  icon: Icon(Icons.warning_rounded),
                  onPressed: () {
                    dialog(
                      StringResources.rootDetected,
                      StringResources.rootDetectedPrompt,
                    );
                  },
                )
              : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _isLoading ? _loading() : _markAttendance(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          fetchCourses();
        },
      ),
    );
  }

  Widget _loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text(StringResources.fetchingActiveCourses),
      ],
    );
  }

  Widget _markAttendance() {
    List<Widget> tiles = [];

    if (courses.isEmpty) {
      return _empty();
    }

    courses.forEach((element) {
      tiles.add(courseListTile(element));
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tiles,
    );
  }

  Widget courseListTile(Course course) {
    return Card(
      child: ListTile(
        title: Text("${course.courseCode} : ${course.courseName}"),
        subtitle: Text(course.instructor.name),
        trailing: IconButton(
          icon: Icon(Icons.menu_book_outlined),
          onPressed: () async {
            await Globals.initialize();
            User user = FirebaseAuth.instance.currentUser;
            String serverKey = await Globals.secureStorage
                .read(key: StringResources.serverKey);
            Attendance attendance = Attendance(
              student: Student(
                instituteEmail: user.email,
                googleUid: user.uid,
                name: user.displayName,
              ),
              course: course,
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
              serverKey: serverKey,
            );
            await AttendanceAPi.postAttendance(attendance);
            Fluttertoast.showToast(msg: StringResources.attendaneMarked);
          },
        ),
        // onTap: () async {},
      ),
    );
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

  Widget _empty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringResources.noActiveAttendance, style: Styles.heading2),
        SizedBox(height: 30),
        Text(StringResources.noActiveAttendancePrompt),
      ],
    );
  }
}
