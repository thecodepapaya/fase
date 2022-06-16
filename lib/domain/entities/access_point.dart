import 'dart:convert';

class AccessPoint {
  AccessPoint({
    required this.accessPointsPrefix,
  });

  static empty() => AccessPoint(
        accessPointsPrefix: [],
      );

  final List<String> accessPointsPrefix;

  factory AccessPoint.fromJson(String str) => AccessPoint.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessPoint.fromMap(Map<String, dynamic>? json) {
    late final AccessPoint accessPointData;
    final isEmpty = json == null;

    accessPointData = isEmpty
        ? AccessPoint.empty()
        : AccessPoint(
            accessPointsPrefix: List<String>.from((json['access_points_prefix'] ?? []).map((e) => e.toString())),
          );

    return accessPointData;
  }

  Map<String, dynamic> toMap() => {
        'access_points_prefix': accessPointsPrefix,
      };
}
