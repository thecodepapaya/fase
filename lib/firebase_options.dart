// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAY0oqyF4fcc1nybwh96nGmScYyNjdVA5I',
    appId: '1:11202985363:web:1512a0dbfac9d4dfa1fc66',
    messagingSenderId: '11202985363',
    projectId: 'fase-35702',
    authDomain: 'fase-35702.firebaseapp.com',
    storageBucket: 'fase-35702.appspot.com',
    measurementId: 'G-2QELZKH3M1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2g7ukNEocEmVp4A35RW7kIoqadfZ5_qA',
    appId: '1:11202985363:android:dd2212e49b28af08a1fc66',
    messagingSenderId: '11202985363',
    projectId: 'fase-35702',
    storageBucket: 'fase-35702.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfqbFC3SxOWcI7FZ5cT8ogKGIO4rUKDTE',
    appId: '1:11202985363:ios:b8275a241d28b1b1a1fc66',
    messagingSenderId: '11202985363',
    projectId: 'fase-35702',
    storageBucket: 'fase-35702.appspot.com',
    androidClientId: '11202985363-6aubanmhbvmfkhdk5c8d6kbg1grsjmsf.apps.googleusercontent.com',
    iosClientId: '11202985363-cktmo09c4asm0bddreu53ihdduicbmbu.apps.googleusercontent.com',
    iosBundleId: 'dev.thecodepapaya.fase',
  );
}