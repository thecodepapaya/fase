import 'package:fase/models/course.dart';
import 'package:fase/models/device.dart';
import 'package:fase/models/student_data.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_data.g.dart';

@JsonSerializable()
class AttendanceData {
  @JsonKey(name: 'studentData')
  StudentData studentData;
  @JsonKey(name: 'device')
  Device device;
  @JsonKey(name: 'course')
  Course course;

  AttendanceData({
    @required this.course,
    @required this.device,
    @required this.studentData,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataToJson(this);
}
