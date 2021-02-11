import 'dart:io';

import 'package:fase/globals.dart';
import 'package:fase/ui/sign_in_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  final Trace myTrace = FirebasePerformance.instance.newTrace("test_trace");

  myTrace.start();

  await Globals.initialize();
  HttpOverrides.global = new MyHttpOverrides();

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
  // print('sdkInt on:   ${androidInfo.version.sdkInt}');
  // print('androidId on:   ${androidInfo.androidId}');
  // print('device on:  ${androidInfo.device}');
  // print('tags on:  ${androidInfo.tags}');

  var wifiBSSID = await WifiInfo().getWifiBSSID();
  // var wifiIP = await WifiInfo().getWifiIP();
  // var wifiName = await WifiInfo().getWifiName();

  print(wifiBSSID);
  // print(wifiIP);
  // print(wifiName);

  // print("${Globals().appName}");
  // print("${Globals().packageName}");
  // print("${Globals().version}");
  // print("${Globals().buildNumber}");

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
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SignInHandler(),
    );
  }
}

// Allowing all certificates including self signed ones
// https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
