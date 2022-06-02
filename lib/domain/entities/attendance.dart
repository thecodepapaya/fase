// To parse this JSON data, do
//
//     final attendance = attendanceFromMap(jsonString);

import 'dart:convert';

class Attendance {
  Attendance({
    this.id,
    required this.timestamp,
    required this.course,
    required this.student,
    required this.registration,
  });

  final int? id;
  final DateTime? timestamp;
  final int course;
  final String student;
  final int registration;

  Attendance copyWith({
    int? id,
    DateTime? timestamp,
    int? course,
    String? student,
    int? registration,
  }) =>
      Attendance(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        course: course ?? this.course,
        student: student ?? this.student,
        registration: registration ?? this.registration,
      );

  factory Attendance.fromJson(String str) => Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json['id'],
        timestamp: json['timestamp'] == null ? null : DateTime.parse(json['timestamp']),
        course: json['course'],
        student: json['student'],
        registration: json['registration'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'timestamp': timestamp?.toIso8601String(),
        'course': course,
        'student': student,
        'registration': registration,
      };
}
