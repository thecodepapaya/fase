import 'dart:convert';

import 'package:fase/domain/entities/user.dart';

class Faculty extends User {
  Faculty({
    required this.instituteEmail,
    required this.googleUid,
    required super.name,
  }) : super(emailID: instituteEmail);

  String instituteEmail;
  String googleUid;

  Faculty copyWith({
    String? instituteEmail,
    String? googleUid,
    String? name,
    String? accessToken,
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
