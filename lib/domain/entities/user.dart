// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.instituteEmail,
    required this.name,
    required this.displayPicture,
    required this.isFaculty,
  });

  final String instituteEmail;
  final String name;
  final dynamic displayPicture;
  final bool isFaculty;

  User copyWith({
    String? instituteEmail,
    String? name,
    dynamic? displayPicture,
    bool? isFaculty,
  }) =>
      User(
        instituteEmail: instituteEmail ?? this.instituteEmail,
        name: name ?? this.name,
        displayPicture: displayPicture ?? this.displayPicture,
        isFaculty: isFaculty ?? this.isFaculty,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        instituteEmail: json['institute_email'],
        name: json['name'],
        displayPicture: json['display_picture'],
        isFaculty: json['is_faculty'],
      );

  Map<String, dynamic> toMap() => {
        'institute_email': instituteEmail,
        'name': name,
        'display_picture': displayPicture,
        'is_faculty': isFaculty,
      };
}
