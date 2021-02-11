// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Course {
  Course({
    @required this.courseCode,
    @required this.courseName,
    @required this.instructorName,
  });

  final String courseCode;
  final String courseName;
  final String instructorName;

  Course copyWith({
    String courseCode,
    String courseName,
    String instructorName,
  }) =>
      Course(
        courseCode: courseCode ?? this.courseCode,
        courseName: courseName ?? this.courseName,
        instructorName: instructorName ?? this.instructorName,
      );

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseCode: json["course_code"],
        courseName: json["course_name"],
        instructorName: json["instructor_name"],
      );

  Map<String, dynamic> toJson() => {
        "course_code": courseCode,
        "course_name": courseName,
        "instructor_name": instructorName,
      };
}
