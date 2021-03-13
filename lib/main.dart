import 'dart:io';

import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/ui/course_editpage.dart';
import 'package:fase/ui/course_page.dart';
import 'package:fase/ui/home_page.dart';
import 'package:fase/ui/sign_in_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (!kIsWeb)
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
      initialRoute: SignInHandler.route,
      routes: {
        SignInHandler.route: (_) => SignInHandler(),
        HomePage.route: (_) => HomePage(),
        CoursePage.route: (_) => CoursePage(),
        CourseEditPage.route: (_) => CourseEditPage(),
      },
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
