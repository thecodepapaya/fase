import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable(nullable: false)
class Device {
  @JsonKey(name: 'model')
  String model;
  @JsonKey(name: 'isPhysicalDevice')
  bool isPhysicalDevice;
  @JsonKey(name: 'isRooted')
  bool isRooted;
  @JsonKey(name: 'brand')
  String brand;
  @JsonKey(name: 'fingerprint')
  String fingerprint;
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'sdkInt')
  String sdkInt;
  @JsonKey(name: 'androidId')
  String androidId;
  @JsonKey(name: 'device')
  String device;
  @JsonKey(name: 'tags')
  String tags;

  Device({
    @required this.androidId,
    @required this.sdkInt,
    @required this.brand,
    @required this.device,
    @required this.fingerprint,
    @required this.id,
    @required this.isPhysicalDevice,
    @required this.isRooted,
    @required this.model,
    @required this.tags,
    @required this.type,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
