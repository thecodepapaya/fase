// To parse this JSON data, do
//
//     final registrationData = registrationDataFromJson(jsonString);

import 'package:fase/models/student_data.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Registration {
  Registration({
    this.registrationId,
    @required this.studentData,
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
    this.serverKey,
  });

  final int registrationId;
  final StudentData studentData;
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

  Registration copyWith({
    int registrationId,
    StudentData studentData,
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
      Registration(
        registrationId: registrationId ?? this.registrationId,
        studentData: studentData ?? this.studentData,
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

  factory Registration.fromRawJson(String str) =>
      Registration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        registrationId: json["registration_id"],
        studentData: StudentData.fromJson(json["student_data"]),
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
        // "registration_id": registrationId,
        "student_data": studentData.toJson(),
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
        // "server_key": serverKey,
      };
}

// class StudentData {
//   StudentData({
//     @required this.instituteEmail,
//     @required this.googleUid,
//     @required this.name,
//   });

//   final String instituteEmail;
//   final String googleUid;
//   final String name;

//   StudentData copyWith({
//     String instituteEmail,
//     String googleUid,
//     String name,
//   }) =>
//       StudentData(
//         instituteEmail: instituteEmail ?? this.instituteEmail,
//         googleUid: googleUid ?? this.googleUid,
//         name: name ?? this.name,
//       );

//   factory StudentData.fromRawJson(String str) =>
//       StudentData.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
//         instituteEmail: json["institute_email"],
//         googleUid: json["google_uid"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "institute_email": instituteEmail,
//         "google_uid": googleUid,
//         "name": name,
//       };
// }
