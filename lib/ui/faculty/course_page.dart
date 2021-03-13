// import 'package:fase/globals.dart';
// import 'package:fase/models/course.dart';
// import 'package:fase/models/faculty.dart';
// import 'package:fase/string_resource.dart';
// import 'package:fase/utils/api.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class FacultyCoursePage extends StatefulWidget {
//   static const String route = '/FacultyCoursePage';
//   @override
//   _FacultyCoursePageState createState() => _FacultyCoursePageState();
// }

// class _FacultyCoursePageState extends State<FacultyCoursePage> {
//   bool _isLoading = true;

//   List<Course> courses = [];
//   String accessToken;

//   // static final Faculty facultySelf = Faculty(
//   //   instituteEmail: FirebaseAuth.instance.currentUser.email,
//   //   googleUid: FirebaseAuth.instance.currentUser.uid,
//   //   name: FirebaseAuth.instance.currentUser.displayName,
//   // );

//   @override
//   void initState() {
//     super.initState();
//     fetchCourses();
//   }

//   void fetchCourses() async {
//     setState(() {
//       _isLoading = true;
//     });
//     courses = await FacultyApi.getFacultyCourses();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(StringResources.yourCourses),
//       ),
//       body: _isLoading ? _loading() : Container(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.save),
//       ),
//     );
//   }

//   Widget _loading() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircularProgressIndicator(),
//         SizedBox(height: 20),
//         Text(StringResources.fetchingCourses),
//       ],
//     );
//   }
// }
