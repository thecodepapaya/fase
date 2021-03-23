// To parse this JSON data, do
//
//     final bleVerification = bleVerificationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BleVerification {
  BleVerification({
    this.id,
    @required this.verifiedBy,
    this.verifiedAt,
    @required this.verifiedFor,
  });

  final int id;
  final String verifiedBy;
  final DateTime verifiedAt;
  final int verifiedFor;

  BleVerification copyWith({
    int id,
    String verifiedBy,
    DateTime verifiedAt,
    int verifiedFor,
  }) =>
      BleVerification(
        id: id ?? this.id,
        verifiedBy: verifiedBy ?? this.verifiedBy,
        verifiedAt: verifiedAt ?? this.verifiedAt,
        verifiedFor: verifiedFor ?? this.verifiedFor,
      );

  factory BleVerification.fromRawJson(String str) =>
      BleVerification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BleVerification.fromJson(Map<String, dynamic> json) =>
      BleVerification(
        id: json["id"],
        verifiedBy: json["verified_by"],
        verifiedAt: DateTime.parse(json["verified_at"]),
        verifiedFor: json["verified_for"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verified_by": verifiedBy,
        "verified_at": verifiedAt?.toIso8601String(),
        "verified_for": verifiedFor,
      };
}
