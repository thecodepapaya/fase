// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentData _$StudentDataFromJson(Map<String, dynamic> json) {
  return StudentData(
    googleUid: json['googleUid'] as String,
    instituteEmail: json['instituteEmail'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$StudentDataToJson(StudentData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'googleUid': instance.googleUid,
      'instituteEmail': instance.instituteEmail,
    };
