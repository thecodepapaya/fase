// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:fase/models/faculty.dart';
import 'package:meta/meta.dart';

class Course {
  Course({
    this.id,
    @required this.instructor,
    @required this.courseCode,
    @required this.courseName,
    @required this.semester,
    @required this.academicYear,
    @required this.startTimestamp,
    @required this.attendanceDuration,
  });

  final int id;
  final Faculty instructor;
  final String courseCode;
  final String courseName;
  final String semester;
  final String academicYear;
  final DateTime startTimestamp;
  final int attendanceDuration;

  Course copyWith({
    int id,
    Faculty instructor,
    String courseCode,
    String courseName,
    String semester,
    String academicYear,
    DateTime startTimestamp,
    int attendanceDuration,
  }) =>
      Course(
        id: id ?? this.id,
        instructor: instructor ?? this.instructor,
        courseCode: courseCode ?? this.courseCode,
        courseName: courseName ?? this.courseName,
        semester: semester ?? this.semester,
        academicYear: academicYear ?? this.academicYear,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        attendanceDuration: attendanceDuration ?? this.attendanceDuration,
      );

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        instructor: Faculty.fromJson(json["instructor"]),
        courseCode: json["course_code"],
        courseName: json["course_name"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        startTimestamp: DateTime.parse(json["start_timestamp"]),
        attendanceDuration: json["attendance_duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructor": instructor.toJson(),
        "course_code": courseCode,
        "course_name": courseName,
        "semester": semester,
        "academic_year": academicYear,
        "start_timestamp": startTimestamp.toIso8601String(),
        "attendance_duration": attendanceDuration,
      };
}
