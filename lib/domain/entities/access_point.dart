import 'dart:convert';

class AccessPoint {
  AccessPoint({
    required this.accessPointsPrefix,
    required this.accessPointsList,
  });

  static empty() => AccessPoint(
        accessPointsPrefix: [],
        accessPointsList: [],
      );

  final List<String> accessPointsPrefix;
  final List<String> accessPointsList;

  factory AccessPoint.fromJson(String str) => AccessPoint.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessPoint.fromMap(Map<String, dynamic>? json) {
    late final AccessPoint accessPointData;
    final isEmpty = json == null;

    accessPointData = isEmpty
        ? AccessPoint.empty()
        : AccessPoint(
            accessPointsList: List<String>.from((json['access_points'] ?? []).map((e) => e.toString())),
            accessPointsPrefix: List<String>.from((json['access_points_prefix'] ?? []).map((e) => e.toString())),
          );

    return accessPointData;
  }

  Map<String, dynamic> toMap() => {
        'access_points': accessPointsList,
        'access_points_prefix': accessPointsPrefix,
      };
}
