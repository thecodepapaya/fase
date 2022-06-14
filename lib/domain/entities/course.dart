import 'dart:convert';

import 'package:fase/domain/entities/user.dart';

class Course {
  Course({
    this.id,
    required this.courseCode,
    required this.courseName,
    required this.semester,
    required this.academicYear,
    this.instructors = const [],
    this.startTimestamp,
    this.attendanceDurationInMinutes = 5,
    this.isAlreadyMarked = false,
    this.section,
  });

  final int? id;
  final String courseCode;
  final String courseName;
  final String semester;
  final String academicYear;
  final List<User> instructors;
  final DateTime? startTimestamp;
  final int attendanceDurationInMinutes;
  final bool isAlreadyMarked;
  final String? section;

  Course copyWith({
    int? id,
    String? courseCode,
    String? courseName,
    String? semester,
    String? academicYear,
    List<User>? instructors,
    DateTime? startTimestamp,
    int? attendanceDurationInMinutes,
    bool? isAlreadyMarked,
    String? description,
  }) =>
      Course(
        id: id ?? this.id,
        courseCode: courseCode ?? this.courseCode,
        courseName: courseName ?? this.courseName,
        semester: semester ?? this.semester,
        academicYear: academicYear ?? this.academicYear,
        instructors: instructors ?? this.instructors,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        attendanceDurationInMinutes: attendanceDurationInMinutes ?? this.attendanceDurationInMinutes,
        isAlreadyMarked: isAlreadyMarked ?? this.isAlreadyMarked,
        section: description ?? this.section,
      );

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json['id'],
        courseCode: json['course_code'],
        courseName: json['course_name'],
        semester: json['semester'],
        academicYear: json['academic_year'],
        instructors:
            json['instructors'] == null ? [] : List<User>.from(json['instructors'].map((x) => User.fromMap(x))),
        startTimestamp: json['start_timestamp'] == null ? null : DateTime.parse(json['start_timestamp']).toLocal(),
        attendanceDurationInMinutes: json['attendance_duration_in_minutes'],
        isAlreadyMarked: json['is_already_marked'],
        section: json['section'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'course_code': courseCode,
        'course_name': courseName,
        'semester': semester,
        'academic_year': academicYear,
        'instructors': List<dynamic>.from(instructors.map((x) => x.toMap())),
        'start_timestamp': startTimestamp?.toIso8601String(),
        'attendance_duration_in_minutes': attendanceDurationInMinutes,
        'is_already_marked': isAlreadyMarked,
        'section': section,
      };
}
