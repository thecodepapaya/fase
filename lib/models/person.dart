// To parse this JSON data, do
//
//     final person = Person.FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Person {
  Person({
    @required this.instituteEmail,
    @required this.googleUid,
    @required this.name,
  });

  final String instituteEmail;
  final String googleUid;
  final String name;

  Person copyWith({
    String instituteEmail,
    String googleUid,
    String name,
  }) =>
      Person(
        instituteEmail: instituteEmail ?? this.instituteEmail,
        googleUid: googleUid ?? this.googleUid,
        name: name ?? this.name,
      );

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
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
