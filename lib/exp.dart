import 'package:fase/string_resource.dart';
import 'package:flt_worker/flt_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Experiment extends StatefulWidget {
  static const route = '/exp';
  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("beacon"),
          onPressed: () async {
            // BluetoothLE.startBleScan();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const platform = const MethodChannel(StringResources.methodChannel);
          var value;
          try {
            value = await platform.invokeMethod('bleAd', {"data": "ID2567"});
          } on PlatformException catch (e) {
            print('''Failed $e''');
          }
          print("Value Method call: $value");
        },
        child: Text("+"),
      ),
    );
  }
}
