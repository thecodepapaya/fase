import 'package:fase/models/app_info.dart';
import 'package:fase/models/device.dart';
import 'package:fase/models/student_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_data.g.dart';

@JsonSerializable()
class RegistrationData {
  @JsonKey(name: 'device')
  Device device;
  @JsonKey(name: 'studentData')
  StudentData studentData;
  @JsonKey(name: 'appInfo')
  AppInfo appInfo;

  RegistrationData({
    @required this.appInfo,
    @required this.device,
    @required this.studentData,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationDataToJson(this);
}
