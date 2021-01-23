// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationData _$RegistrationDataFromJson(Map<String, dynamic> json) {
  return RegistrationData(
    appInfo: json['appInfo'] == null
        ? null
        : AppInfo.fromJson(json['appInfo'] as Map<String, dynamic>),
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    studentData: json['studentData'] == null
        ? null
        : StudentData.fromJson(json['studentData'] as Map<String, dynamic>),
    wifiInfo: json['wifiInfo'] == null
        ? null
        : WiFiInfo.fromJson(json['wifiInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegistrationDataToJson(RegistrationData instance) =>
    <String, dynamic>{
      'device': instance.device,
      'studentData': instance.studentData,
      'appInfo': instance.appInfo,
      'wifiInfo': instance.wifiInfo,
    };
