// To parse this JSON data, do
//
//     final faculty = facultyFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

class Faculty {
  Faculty({
    @required this.instituteEmail,
    @required this.googleUid,
    @required this.name,
  });

  String instituteEmail;
  String googleUid;
  String name;

  Faculty copyWith({
    String instituteEmail,
    String googleUid,
    String name,
    String accessToken,
  }) =>
      Faculty(
        instituteEmail: instituteEmail ?? this.instituteEmail,
        googleUid: googleUid ?? this.googleUid,
        name: name ?? this.name,
      );

  factory Faculty.fromRawJson(String str) => Faculty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
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
