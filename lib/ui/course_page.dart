import 'package:fase/globals.dart';
import 'package:fase/models/attendance_data.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/student.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/styles.dart';
import 'package:fase/ui/course_editpage.dart';
import 'package:fase/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoursePage extends StatefulWidget {
  static const route = '/CoursePage';

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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

    courses = Globals.isFaculty
        ? await FacultyApi.getFacultyCourses()
        : await CourseApi.getCourses();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Globals.isFaculty
              ? StringResources.yourCourses
              : StringResources.activeAttendances,
        ),
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
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                fetchCourses();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _isLoading ? _loading() : _courseList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Globals.isFaculty ? Icons.add : Icons.refresh),
        onPressed: () async {
          Globals.isFaculty ? addCourses() : fetchCourses();
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
        Text(Globals.isFaculty
            ? StringResources.fetchingRegisteredCourses
            : StringResources.fetchingActiveCourses),
      ],
    );
  }

  void addCourses() {
    Navigator.of(context).pushNamed(CourseEditPage.route);
  }

  Widget _courseList() {
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
        subtitle: Globals.isFaculty
            ? Text(course.semester + ' ' + course.academicYear)
            : Text(course.instructor.name),
        trailing: IconButton(
          icon: Icon(
            Globals.isFaculty ? Icons.watch_later_rounded : Icons.person_add,
          ),
          onPressed: () async {
            await Globals.initialize();

            if (Globals.isFaculty) {
              await startAttendance(course);
            } else {
              await markAttendance(course);
            }
          },
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            CourseEditPage.route,
            arguments: course,
          );
        },
      ),
    );
  }

  Future<void> startAttendance(Course oldCourse) async {
    Course newCourse = oldCourse.copyWith(startTimestamp: DateTime.now());
    // Needed since Google UID is not received from server and hence is not
    // stored by default in the course object either. Thus adding the value
    // explicitly. It is necessary as it is like a password for faculties.
    newCourse.instructor.googleUid = FirebaseAuth.instance.currentUser.uid;
    Course updatedCourse = await CourseApi.postUpdateCourse(newCourse);
    if (updatedCourse.startTimestamp == oldCourse.startTimestamp) {
      Fluttertoast.showToast(msg: StringResources.failedStartAttendance);
    } else {
      Fluttertoast.showToast(
        msg: StringResources.attendanceStarted +
            'for ${updatedCourse.courseCode}',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> markAttendance(Course course) async {
    User user = FirebaseAuth.instance.currentUser;
    String serverKey =
        await Globals.secureStorage.read(key: StringResources.serverKey);
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
    Fluttertoast.showToast(msg: StringResources.attendanceMarked);
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
    String head = Globals.isFaculty
        ? StringResources.noCourseRegistered
        : StringResources.noActiveAttendance;
    String body = Globals.isFaculty
        ? StringResources.noCourseRegisteredPrompt
        : StringResources.noActiveAttendancePrompt;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(head, style: Styles.heading2),
        SizedBox(height: 30),
        Text(body),
      ],
    );
  }
}
