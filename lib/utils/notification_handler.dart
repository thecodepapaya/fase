import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsHandler {
  static AndroidInitializationSettings _initializationSettingsAndroid;
  static IOSInitializationSettings _initializationSettingsIOS;
  static InitializationSettings _initializationSettings;

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    _initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_icon');

    _initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
  }

  static Future<void> showBLENotification() async {
    const BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(
      'Verifying your attendance over BLE. This can take upto 10 minutes to complete. Please do not turn off Bluetooth or diconnect yourself from the IIITV WIFI',
      htmlFormatBigText: true,
      contentTitle: 'Verifying your Attendance',
      htmlFormatContentTitle: true,
      summaryText: 'BLE Verification',
      htmlFormatSummaryText: true,
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BLEV',
      'Attendance verification',
      'Verifying attendance over BluetoothLE',
      importance: Importance.high,
      priority: Priority.high,
      playSound: false,
      ongoing: true,
      autoCancel: false,
      usesChronometer: true,
      styleInformation: bigTextStyleInformation,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Verifying your attendance',
      'Please do NOT turn off Bluetooth or stop the app',
      platformChannelSpecifics,
    );
  }

  static Future<void> showVerifiedNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BLEV',
      'Attendance verification',
      'Verifying attendance over BluetoothLE',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      1,
      'Verification complete',
      'Attendance verification process complete',
      platformChannelSpecifics,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
