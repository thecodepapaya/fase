// // import 'package:fase/utils/bluetooth_le.dart';
// // import 'package:fase/utils/notification_handler.dart';
// import 'package:fase/utils/bluetooth_le.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';
// // import 'package:flt_worker/flt_worker.dart';

// /// This function executes the code for background BLE verification
// // Future<void> callbackDispatcher(WorkPayload payload) {
// // Workmanager.executeTask((task, inputData) async {
// //   print('$task for input data $inputData');
// //   await NotificationsHandler.initialize();

// //   //TODO: start beacon with some attendance ID
// // NotificationsHandler.showBLENotification();
// // BluetoothLE.startBleScan();

// //   // BluetoothLE.startBleBeacon(0);
// //   // print('wait 30 seconds');
// //   // //TODO: update sleep duration
// //   // sleep(Duration(minutes: 1));
// //   // await NotificationsHandler.cancelNotification(0);
// //   // await NotificationsHandler.showVerifiedNotification();
// //   return Future.value(true);
// // });
// // }

// void startForegroundService() async {
//   await FlutterForegroundPlugin.setServiceMethodInterval(seconds: 15);
//   await FlutterForegroundPlugin.setServiceMethod(globalForegroundService);
//   await FlutterForegroundPlugin.startForegroundService(
//     holdWakeLock: false,
//     onStarted: () {
//       print("Foreground on Started");
//     },
//     onStopped: () {
//       print("Foreground on Stopped");
//     },
//     title: "Validating Attendance",
//     content: "Do not kill the app or turn off Wifi/BT",
//     iconName: "launcher_icon",
//   );
// }

// void globalForegroundService() {
//   BluetoothLE.startBleBeacon(0);
//   BluetoothLE.startBleScan();
//   debugPrint("current datetime is ${DateTime.now()}");
// }
