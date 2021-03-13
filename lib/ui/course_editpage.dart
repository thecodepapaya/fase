import 'package:fase/models/course.dart';
import 'package:fase/models/faculty.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/ui/course_page.dart';
import 'package:fase/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CourseEditPage extends StatefulWidget {
  static const String route = '/CourseEditPage';

  @override
  _CourseEditPageState createState() => _CourseEditPageState();
}

class _CourseEditPageState extends State<CourseEditPage> {
  Course _course;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _courseCodeController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  String semesterValue = StringResources.autumn;
  String academicYearValue =
      '${DateTime.now().year}-${DateTime.now().year + 1}';

  @override
  Widget build(BuildContext context) {
    _course = ModalRoute.of(context).settings.arguments;
    if (_course != null) {
      _courseCodeController.text = _course.courseCode;
      _courseNameController.text = _course.courseName;
      semesterValue = _course.semester;
      academicYearValue = _course.academicYear;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.addEditCourse),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _courseCodeController,
                  autocorrect: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: StringResources.courseCode,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _courseNameController,
                  autocorrect: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: StringResources.courseName,
                  ),
                ),
                SizedBox(height: 40),
                DropdownButton(
                  value: semesterValue,
                  items: <DropdownMenuItem>[
                    DropdownMenuItem(
                      child: Text(StringResources.autumn),
                      value: StringResources.autumn,
                    ),
                    DropdownMenuItem(
                      child: Text(StringResources.winter),
                      value: StringResources.winter,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      semesterValue = value;
                    });
                  },
                ),
                SizedBox(height: 40),
                DropdownButton(
                  value: academicYearValue,
                  items: years(),
                  onChanged: (value) {
                    setState(() {
                      academicYearValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          User user = FirebaseAuth.instance.currentUser;
          _course = _course.copyWith(
            instructor: Faculty(
              googleUid: user.uid,
              instituteEmail: user.email,
              name: user.displayName,
            ),
            courseCode: _courseCodeController.text,
            courseName: _courseNameController.text,
            semester: semesterValue,
            academicYear: academicYearValue,
            startTimestamp: DateTime.now().subtract(
              Duration(minutes: 30),
            ),
          );
          Course receivedCourse;
          receivedCourse = _course == null
              ? await CourseApi.postNewCourse(_course)
              : await CourseApi.postUpdateCourse(_course);
          // i.e if request was successful
          if (receivedCourse != null) {
            Navigator.of(context)
                .popUntil(ModalRoute.withName(CoursePage.route));
          }
        },
      ),
    );
  }

  List<DropdownMenuItem> years() {
    List<DropdownMenuItem> items = [];
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= 2020; i--) {
      items.add(DropdownMenuItem(
        child: Text('$i-${i + 1}'),
        value: '$i-${i + 1}',
      ));
    }
    return items;
  }
}
