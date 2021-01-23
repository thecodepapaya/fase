import 'package:fase/models/app_info.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/device.dart';
import 'package:fase/models/student_data.dart';
import 'package:fase/models/wifi_info.dart';
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
  @JsonKey(name: 'wifiInfo')
  WiFiInfo wifiInfo;
  @JsonKey(name: 'appInfo')
  AppInfo appInfo;

  AttendanceData({
    @required this.course,
    @required this.device,
    @required this.studentData,
    @required this.wifiInfo,
    @required this.appInfo,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceDataToJson(this);
}
