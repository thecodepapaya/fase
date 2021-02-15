import 'dart:io';

import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/ui/sign_in_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';

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

  // Metadata metadata = await MetadataApi.getMetadata();
  // print(metadata.minAppBuild);
  // print(metadata.minAppVersion);

  // var wifiBSSID = await WifiInfo().getWifiBSSID();

  // print(wifiBSSID);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringResources.fase,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SignInHandler(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
