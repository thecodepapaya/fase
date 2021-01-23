// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfo _$AppInfoFromJson(Map<String, dynamic> json) {
  return AppInfo(
    appName: json['appName'] as String,
    buildNumber: json['buildNumber'] as int,
    packageName: json['packageName'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$AppInfoToJson(AppInfo instance) => <String, dynamic>{
      'appName': instance.appName,
      'packageName': instance.packageName,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
    };
