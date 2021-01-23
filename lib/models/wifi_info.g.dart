// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WiFiInfo _$WiFiInfoFromJson(Map<String, dynamic> json) {
  return WiFiInfo(
    bssid: json['bssid'] as String,
    localIP: json['localIP'] as String,
    ssid: json['ssid'] as String,
  );
}

Map<String, dynamic> _$WiFiInfoToJson(WiFiInfo instance) => <String, dynamic>{
      'ssid': instance.ssid,
      'bssid': instance.bssid,
      'localIP': instance.localIP,
    };
