// To parse this JSON data, do
//
//     final studentData = studentDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class StudentData {
  StudentData({
    @required this.instituteEmail,
    @required this.googleUid,
    @required this.name,
  });

  final String instituteEmail;
  final String googleUid;
  final String name;

  StudentData copyWith({
    String instituteEmail,
    String googleUid,
    String name,
  }) =>
      StudentData(
        instituteEmail: instituteEmail ?? this.instituteEmail,
        googleUid: googleUid ?? this.googleUid,
        name: name ?? this.name,
      );

  factory StudentData.fromRawJson(String str) =>
      StudentData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        instituteEmail: json["institute_email"],
        googleUid: json["google_uid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "institute_email": instituteEmail,
        "google_uid": googleUid,
        "name": name,
      };
}
