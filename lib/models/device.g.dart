// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    androidId: json['androidId'] as String,
    sdkInt: json['sdkInt'] as String,
    brand: json['brand'] as String,
    device: json['device'] as String,
    fingerprint: json['fingerprint'] as String,
    id: json['id'] as String,
    isPhysicalDevice: json['isPhysicalDevice'] as bool,
    isRooted: json['isRooted'] as bool,
    model: json['model'] as String,
    tags: json['tags'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'model': instance.model,
      'isPhysicalDevice': instance.isPhysicalDevice,
      'isRooted': instance.isRooted,
      'brand': instance.brand,
      'fingerprint': instance.fingerprint,
      'id': instance.id,
      'type': instance.type,
      'sdkInt': instance.sdkInt,
      'androidId': instance.androidId,
      'device': instance.device,
      'tags': instance.tags,
    };
