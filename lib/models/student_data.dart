import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_data.g.dart';

@JsonSerializable()
class StudentData {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'googleUid')
  String googleUid;
  @JsonKey(name: 'instituteEmail')
  String instituteEmail;

  StudentData({
    @required this.googleUid,
    @required this.instituteEmail,
    @required this.name,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) =>
      _$StudentDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDataToJson(this);
}
