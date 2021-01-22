import 'package:json_annotation/json_annotation.dart';

part 'app_info.g.dart';

@JsonSerializable()
class AppInfo {
  /// The Application name. This name is displayed in the app drawer.
  @JsonKey(name: 'appName')
  String appName;

  /// The package name of the application. Only in.ac.iiitvadodara.fase
  /// is an accepted package name
  @JsonKey(name: 'packageName')
  String packageName;

  /// The version the application currently running on. Repesented as a string
  /// like v1.1.2
  @JsonKey(name: 'version', nullable: false)
  String version;

  /// The build number accociated with the version string. Would always be a
  /// positive integer.
  @JsonKey(name: 'buildNumber')
  int buildNumber;

  AppInfo({
    this.appName,
    this.buildNumber,
    this.packageName,
    this.version,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppInfoToJson(this);
}
