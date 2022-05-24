import 'dart:convert';

import 'package:fase/domain/entities/faculty.dart';

class Course {
  Course({
    this.id,
    required this.instructor,
    required this.courseCode,
    required this.courseName,
    required this.semester,
    required this.academicYear,
    required this.startTimestamp,
    this.attendanceDurationInMinutes = 30,
  });

  final int? id;
  final Faculty instructor;
  final String courseCode;
  final String courseName;
  final String semester;
  final String academicYear;
  final DateTime startTimestamp;
  final int attendanceDurationInMinutes;

  Course copyWith({
    int? id,
    Faculty? instructor,
    String? courseCode,
    String? courseName,
    String? semester,
    String? academicYear,
    DateTime? startTimestamp,
    int? attendanceDuration,
  }) =>
      Course(
        id: id ?? this.id,
        instructor: instructor ?? this.instructor,
        courseCode: courseCode ?? this.courseCode,
        courseName: courseName ?? this.courseName,
        semester: semester ?? this.semester,
        academicYear: academicYear ?? this.academicYear,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        attendanceDurationInMinutes: attendanceDuration ?? this.attendanceDurationInMinutes,
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
        attendanceDurationInMinutes: json["attendance_duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructor": instructor.toJson(),
        "course_code": courseCode,
        "course_name": courseName,
        "semester": semester,
        "academic_year": academicYear,
        "start_timestamp": startTimestamp.toIso8601String(),
        "attendance_duration": attendanceDurationInMinutes,
      };
}

final Course defaultCourse = Course(
  instructor: Faculty(instituteEmail: "instituteEmail@iiitvadodara.ac.in", googleUid: "googleUid", name: "Pramit Mazumdar"),
  courseCode: "CS101",
  courseName: "A very long name for a very boring course for the semester",
  semester: "autumn",
  academicYear: "2022-23",
  startTimestamp: DateTime.now(),
  attendanceDurationInMinutes: 5,
);
