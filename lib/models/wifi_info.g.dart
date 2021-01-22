// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WifiInfo _$WifiInfoFromJson(Map<String, dynamic> json) {
  return WifiInfo(
    bssid: json['bssid'] as String,
    localIP: json['localIP'] as String,
    ssid: json['ssid'] as String,
  );
}

Map<String, dynamic> _$WifiInfoToJson(WifiInfo instance) => <String, dynamic>{
      'ssid': instance.ssid,
      'bssid': instance.bssid,
      'localIP': instance.localIP,
    };
