// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:fase/models/person.dart';
import 'package:meta/meta.dart';

class Course {
  Course({
    @required this.instructor,
    @required this.courseCode,
    @required this.courseName,
    @required this.semester,
    @required this.academicYear,
    @required this.startTimestamp,
  });

  final Person instructor;
  final String courseCode;
  final String courseName;
  final String semester;
  final String academicYear;
  final DateTime startTimestamp;

  Course copyWith({
    Person instructor,
    String courseCode,
    String courseName,
    String semester,
    String academicYear,
    DateTime startTimestamp,
  }) =>
      Course(
        instructor: instructor ?? this.instructor,
        courseCode: courseCode ?? this.courseCode,
        courseName: courseName ?? this.courseName,
        semester: semester ?? this.semester,
        academicYear: academicYear ?? this.academicYear,
        startTimestamp: startTimestamp ?? this.startTimestamp,
      );

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        instructor: Person.fromJson(json["instructor"]),
        courseCode: json["course_code"],
        courseName: json["course_name"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        startTimestamp: DateTime.parse(json["start_timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "instructor": instructor.toJson(),
        "course_code": courseCode,
        "course_name": courseName,
        "semester": semester,
        "academic_year": academicYear,
        "start_timestamp": startTimestamp.toIso8601String(),
      };
}
