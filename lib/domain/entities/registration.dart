// To parse this JSON data, do
//
//     final registration = registrationFromMap(jsonString);

import 'dart:convert';

class Registration {
  Registration({
    this.id,
    required this.timestamp,
    required this.model,
    required this.brand,
    required this.deviceId,
    required this.deviceName,
    required this.isPhysical,
    required this.isRooted,
    required this.appVersionString,
    required this.appBuildNumber,
    required this.ssid,
    required this.bssid,
    required this.localIp,
    required this.os,
    required this.osVersion,
    required this.student,
  });

  final int? id;
  final DateTime? timestamp;
  final String model;
  final String brand;
  final String deviceId;
  final String deviceName;
  final bool isPhysical;
  final bool isRooted;
  final String appVersionString;
  final int appBuildNumber;
  final String ssid;
  final String bssid;
  final String localIp;
  final String os;
  final String osVersion;
  final String student;

  Registration copyWith({
    int? id,
    DateTime? timestamp,
    String? model,
    String? brand,
    String? deviceId,
    String? deviceName,
    bool? isPhysical,
    bool? isRooted,
    String? appVersionString,
    int? appBuildNumber,
    String? ssid,
    String? bssid,
    String? localIp,
    String? os,
    String? osVersion,
    String? student,
  }) =>
      Registration(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        model: model ?? this.model,
        brand: brand ?? this.brand,
        deviceId: deviceId ?? this.deviceId,
        deviceName: deviceName ?? this.deviceName,
        isPhysical: isPhysical ?? this.isPhysical,
        isRooted: isRooted ?? this.isRooted,
        appVersionString: appVersionString ?? this.appVersionString,
        appBuildNumber: appBuildNumber ?? this.appBuildNumber,
        ssid: ssid ?? this.ssid,
        bssid: bssid ?? this.bssid,
        localIp: localIp ?? this.localIp,
        os: os ?? this.os,
        osVersion: osVersion ?? this.osVersion,
        student: student ?? this.student,
      );

  factory Registration.fromJson(String str) => Registration.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Registration.fromMap(Map<String, dynamic> json) => Registration(
        id: json['id'],
        timestamp: json['timestamp'] == null ? null : DateTime.parse(json['timestamp']),
        model: json['model'],
        brand: json['brand'],
        deviceId: json['device_id'],
        deviceName: json['device_name'],
        isPhysical: json['is_physical'],
        isRooted: json['is_rooted'],
        appVersionString: json['app_version_string'],
        appBuildNumber: json['app_build_number'],
        ssid: json['ssid'],
        bssid: json['bssid'],
        localIp: json['local_ip'],
        os: json['os'],
        osVersion: json['os_version'],
        student: json['student'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'timestamp': timestamp?.toIso8601String(),
        'model': model,
        'brand': brand,
        'device_id': deviceId,
        'device_name': deviceName,
        'is_physical': isPhysical,
        'is_rooted': isRooted,
        'app_version_string': appVersionString,
        'app_build_number': appBuildNumber,
        'ssid': ssid,
        'bssid': bssid,
        'local_ip': localIp,
        'os': os,
        'os_version': osVersion,
        'student': student,
      };
}
