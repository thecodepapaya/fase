import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wifi_info.g.dart';

@JsonSerializable()
class WiFiInfo {
  /// SSID aka the name of the WIFI network
  @JsonKey(name: 'ssid')
  String ssid;

  /// BSSID -  the unique address of the access point the user is currently
  /// connected to. The first 8 chars of the BSSID are constant for any wireless
  /// local network
  @JsonKey(name: 'bssid')
  String bssid;

  /// The local network IP assigned to the device.
  @JsonKey(name: 'localIP')
  String localIP;

  WiFiInfo({
    @required this.bssid,
    @required this.localIP,
    @required this.ssid,
  });

  factory WiFiInfo.fromJson(Map<String, dynamic> json) =>
      _$WiFiInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WiFiInfoToJson(this);
}
