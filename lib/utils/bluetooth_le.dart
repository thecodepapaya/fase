import 'package:fase/string_resource.dart';
import 'package:flutter/services.dart';

class BluetoothLE {
  static void startBleBeacon(int attendanceId) async {
    assert(attendanceId > 0);
    var value;
    String broadcastData = 'ID$attendanceId';
    const platform = const MethodChannel(StringResources.methodChannel);
    try {
      // Data should be in format ID1234
      value = await platform.invokeMethod('bleAd', {"data": broadcastData});
    } on PlatformException catch (e) {
      print('Failed to start BLE advertisement $e');
    } on Exception catch (e) {
      print("Unknown error occured while starting BLE advertisement: $e");
    }
    print("Value from Method call: $value");
  }

  // static void startBleScan() async {
  //   FlutterBlue flutterBlue = FlutterBlue.instance;
  //   StreamSubscription subscription;
  //   Set<ScanResult> scanResultSet = Set<ScanResult>();

  //   //TODO set duration from course start time and attendance duration
  //   flutterBlue.startScan(timeout: Duration(seconds: 30));
  //   print('Starting Scan');
  //   NotificationsHandler.showBLENotification();
  //   subscription = flutterBlue.scanResults.listen((results) {
  //     for (ScanResult result in results) {
  //       if (!scanResultSet.contains(result)) {
  //         scanResultSet.add(result);
  //         print(
  //             'Service data: ${result.advertisementData.serviceData} with service UUID: ${result.advertisementData.serviceUuids}');
  //       }
  //     }
  //   });

  //   // subscription.cancel();
  // }

  // static void startBleScan() async {
  //   const platform = const MethodChannel(StringResources.methodChannel);
  //   try {
  //     // Data should be in format ID1234
  //     print("Invoking method bleScan");
  //     await platform.invokeMethod('bleScan', {"data": 8});
  //   } on PlatformException catch (e) {
  //     print('Failed to start BLE scan $e');
  //   } on Exception catch (e) {
  //     print("Unknown error occured while starting BLE scan: $e");
  //   }
  // }
}
