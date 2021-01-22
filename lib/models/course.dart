import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'courseCode')
  String courseCode;
  @JsonKey(name: 'courseName')
  String courseName;
  @JsonKey(name: 'instructorName')
  String instructorName;

  Course({
    @required this.courseCode,
    @required this.courseName,
    @required this.instructorName,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
