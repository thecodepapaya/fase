// To parse this JSON data, do
//
//     final metadata = metadataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Metadata {
  Metadata({
    @required this.minAppBuild,
    @required this.minAppVersion,
  });

  final int minAppBuild;
  final String minAppVersion;

  Metadata copyWith({
    int minAppBuild,
    String minAppVersion,
  }) =>
      Metadata(
        minAppBuild: minAppBuild ?? this.minAppBuild,
        minAppVersion: minAppVersion ?? this.minAppVersion,
      );

  factory Metadata.fromRawJson(String str) =>
      Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        minAppBuild: json["min_app_build"],
        minAppVersion: json["min_app_version"],
      );

  Map<String, dynamic> toJson() => {
        "min_app_build": minAppBuild,
        "min_app_version": minAppVersion,
      };
}
