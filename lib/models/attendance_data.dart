// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:fase/models/course.dart';
import 'package:fase/models/student_data.dart';
import 'package:meta/meta.dart';

class Attendance {
  Attendance({
    this.attendanceId,
    @required this.studentData,
    @required this.course,
    this.timestamp,
    @required this.deviceId,
    @required this.isPhysical,
    @required this.isRooted,
    @required this.fingerprint,
    @required this.sdkInt,
    @required this.appVersionString,
    @required this.appBuildNumber,
    @required this.ssid,
    @required this.bssid,
    @required this.localIp,
    @required this.serverKey,
  });

  final int attendanceId;
  final StudentData studentData;
  final Course course;
  final DateTime timestamp;
  final String deviceId;
  final bool isPhysical;
  final bool isRooted;
  final String fingerprint;
  final int sdkInt;
  final String appVersionString;
  final int appBuildNumber;
  final String ssid;
  final String bssid;
  final String localIp;
  final String serverKey;

  Attendance copyWith({
    int attendanceId,
    StudentData studentData,
    Attendance course,
    DateTime timestamp,
    String deviceId,
    bool isPhysical,
    bool isRooted,
    String fingerprint,
    int sdkInt,
    String appVersionString,
    int appBuildNumber,
    String ssid,
    String bssid,
    String localIp,
    String serverKey,
  }) =>
      Attendance(
        attendanceId: attendanceId ?? this.attendanceId,
        studentData: studentData ?? this.studentData,
        course: course ?? this.course,
        timestamp: timestamp ?? this.timestamp,
        deviceId: deviceId ?? this.deviceId,
        isPhysical: isPhysical ?? this.isPhysical,
        isRooted: isRooted ?? this.isRooted,
        fingerprint: fingerprint ?? this.fingerprint,
        sdkInt: sdkInt ?? this.sdkInt,
        appVersionString: appVersionString ?? this.appVersionString,
        appBuildNumber: appBuildNumber ?? this.appBuildNumber,
        ssid: ssid ?? this.ssid,
        bssid: bssid ?? this.bssid,
        localIp: localIp ?? this.localIp,
        serverKey: serverKey ?? this.serverKey,
      );

  factory Attendance.fromRawJson(String str) =>
      Attendance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        attendanceId: json["attendance_id"],
        studentData: StudentData.fromJson(json["student_data"]),
        course: Course.fromJson(json["course"]),
        timestamp: DateTime.parse(json["timestamp"]),
        deviceId: json["device_id"],
        isPhysical: json["is_physical"],
        isRooted: json["is_rooted"],
        fingerprint: json["fingerprint"],
        sdkInt: json["sdk_int"],
        appVersionString: json["app_version_string"],
        appBuildNumber: json["app_build_number"],
        ssid: json["ssid"],
        bssid: json["bssid"],
        localIp: json["local_ip"],
        serverKey: json["server_key"],
      );

  Map<String, dynamic> toJson() => {
        // "attendance_id": attendanceId,
        "student_data": studentData.toJson(),
        "course": course.toJson(),
        // "timestamp": timestamp.toIso8601String(),
        "device_id": deviceId,
        "is_physical": isPhysical,
        "is_rooted": isRooted,
        "fingerprint": fingerprint,
        "sdk_int": sdkInt,
        "app_version_string": appVersionString,
        "app_build_number": appBuildNumber,
        "ssid": ssid,
        "bssid": bssid,
        "local_ip": localIp,
        "server_key": serverKey,
      };
}
