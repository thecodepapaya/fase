import 'package:fase/string_resource.dart';
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
      StringResources.notifAttendanceBLEBodyBig,
      htmlFormatBigText: true,
      contentTitle: StringResources.notifAttendanceBLEHeadBig,
      htmlFormatContentTitle: true,
      summaryText: StringResources.notifAttendanceBLESummaryBig,
      htmlFormatSummaryText: true,
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      StringResources.notifChannelId,
      StringResources.notifChannelName,
      StringResources.notifChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      playSound: false,
      timeoutAfter: 300000,
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
      StringResources.notifAttendanceBLEHead,
      StringResources.notifAttendanceBLEBody,
      platformChannelSpecifics,
    );
  }

  static Future<void> showVerifiedNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      StringResources.notifChannelId,
      StringResources.notifChannelName,
      StringResources.notifChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      1,
      StringResources.notifAttendanceVerifiedHead,
      StringResources.notifAttendanceVerifiedBody,
      platformChannelSpecifics,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
