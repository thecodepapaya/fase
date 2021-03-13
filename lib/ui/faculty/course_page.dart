import 'package:fase/globals.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/faculty.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentCoursePage extends StatefulWidget {
  @override
  _StudentCoursePageState createState() => _StudentCoursePageState();
}

class _StudentCoursePageState extends State<StudentCoursePage> {
  bool _isLoading = true;

  List<Course> courses = [];
  String accessToken;

  static final Faculty facultySelf = Faculty(
    instituteEmail: FirebaseAuth.instance.currentUser.email,
    googleUid: FirebaseAuth.instance.currentUser.uid,
    name: FirebaseAuth.instance.currentUser.displayName,
  );

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() async {
    accessToken = await Globals.secureStorage.read(
      key: StringResources.accessToken,
    );
    setState(() {
      _isLoading = true;
    });
    courses = await FacultyApi.getFacultyCourses(facultySelf, accessToken);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
