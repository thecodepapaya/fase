// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    courseCode: json['courseCode'] as String,
    courseName: json['courseName'] as String,
    instructorName: json['instructorName'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'instructorName': instance.instructorName,
    };
