import 'dart:io';

import 'package:fase/utils/bluetooth_le.dart';
import 'package:fase/utils/notification_handler.dart';
import 'package:workmanager/workmanager.dart';

/// This function executes the code for background BLE verification
void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    print('$task for input data $inputData');
    await NotificationsHandler.initialize();

    //TODO: start beacon with some attendance ID
    BluetoothLE.startBleScan();
    await NotificationsHandler.showBLENotification();
    BluetoothLE.startBleBeacon(0);
    print('wait 30 seconds');
    //TODO: update sleep duration
    sleep(Duration(minutes: 1));
    await NotificationsHandler.cancelNotification(0);
    await NotificationsHandler.showVerifiedNotification();
    return Future.value(true);
  });
}
