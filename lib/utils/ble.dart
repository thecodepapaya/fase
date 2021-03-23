import 'package:fase/string_resource.dart';
import 'package:flutter/services.dart';

class BluetoothLE {
  // BluetoothLE.initialize() {

  // }

  void startBleBeacon(int attendanceId) async {
    var value;
    String broadcastData = 'ID$attendanceId';
    const platform = const MethodChannel(StringResources.methodChannel);
    try {
      // Data should be in format ID1234
      value = await platform.invokeMethod('bleAd', {"data": broadcastData});
    } on PlatformException catch (e) {
      print('Failed $e');
    }
    print("Value from Method call: $value");
  }

  void startBleScan() {}
}
