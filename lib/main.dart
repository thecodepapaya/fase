import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('model on:   ${androidInfo.model}');
  print('isPhysicalDevice on:  ${androidInfo.isPhysicalDevice}');
  print('brand on:   ${androidInfo.brand}');
  print('fingerprint on:   ${androidInfo.fingerprint}');
  print('id on:  ${androidInfo.id}');
  print('type on:  ${androidInfo.type}');
  print('version on:   ${androidInfo.version.baseOS}');
  print('androidId on:   ${androidInfo.androidId}');
  print('device on:  ${androidInfo.device}');
  print('tags on:  ${androidInfo.tags}');

  var wifiBSSID = await WifiInfo().getWifiBSSID();
  var wifiIP = await WifiInfo().getWifiIP();
  var wifiName = await WifiInfo().getWifiName();

  print(wifiBSSID);
  print(wifiIP);
  print(wifiName);

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  print(appName);
  print(packageName);
  print(version);
  print(buildNumber);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FASE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
