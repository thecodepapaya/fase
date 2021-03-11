// To parse this JSON data, do
//
//     final person = Person.FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Student {
  Student({
    @required this.instituteEmail,
    @required this.googleUid,
    @required this.name,
  });

  final String instituteEmail;
  final String googleUid;
  final String name;

  Student copyWith({
    String instituteEmail,
    String googleUid,
    String name,
  }) =>
      Student(
        instituteEmail: instituteEmail ?? this.instituteEmail,
        googleUid: googleUid ?? this.googleUid,
        name: name ?? this.name,
      );

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
