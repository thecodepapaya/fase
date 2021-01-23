// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceData _$AttendanceDataFromJson(Map<String, dynamic> json) {
  return AttendanceData(
    course: json['course'] == null
        ? null
        : Course.fromJson(json['course'] as Map<String, dynamic>),
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    studentData: json['studentData'] == null
        ? null
        : StudentData.fromJson(json['studentData'] as Map<String, dynamic>),
    wifiInfo: json['wifiInfo'] == null
        ? null
        : WiFiInfo.fromJson(json['wifiInfo'] as Map<String, dynamic>),
    appInfo: json['appInfo'] == null
        ? null
        : AppInfo.fromJson(json['appInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttendanceDataToJson(AttendanceData instance) =>
    <String, dynamic>{
      'studentData': instance.studentData,
      'device': instance.device,
      'course': instance.course,
      'wifiInfo': instance.wifiInfo,
      'appInfo': instance.appInfo,
    };
