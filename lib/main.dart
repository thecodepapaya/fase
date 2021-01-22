import 'package:fase/globals.dart';
import 'package:fase/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  final Trace myTrace = FirebasePerformance.instance.newTrace("test_trace");

  myTrace.start();

  await Globals.initialize();

  myTrace.stop();

  // await LocationPermission().requestPermisson();

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  // print('model on:   ${androidInfo.model}');
  // print('isPhysicalDevice on:  ${androidInfo.isPhysicalDevice}');
  // print('brand on:   ${androidInfo.brand}');
  // print('fingerprint on:   ${androidInfo.fingerprint}');
  // print('id on:  ${androidInfo.id}');
  // print('type on:  ${androidInfo.type}');
  // print('version on:   ${androidInfo.version.baseOS}');
  // print('androidId on:   ${androidInfo.androidId}');
  // print('device on:  ${androidInfo.device}');
  // print('tags on:  ${androidInfo.tags}');

  var wifiBSSID = await WifiInfo().getWifiBSSID();
  // var wifiIP = await WifiInfo().getWifiIP();
  // var wifiName = await WifiInfo().getWifiName();

  print(wifiBSSID);
  // print(wifiIP);
  // print(wifiName);

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
      home: HomePage(),
    );
  }
}
