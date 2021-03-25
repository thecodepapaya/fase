import 'dart:async';
import 'dart:convert';

import 'package:fase/models/attendance_data.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/ui/home_page.dart';
import 'package:fase/utils/api.dart';
import 'package:fase/utils/bluetooth_le.dart';
import 'package:fase/utils/notification_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AttendanceVerificationPage extends StatefulWidget {
  static const String route = '/attendanceVerificationPage';

  @override
  _AttendanceVerificationPageState createState() =>
      _AttendanceVerificationPageState();
}

class _AttendanceVerificationPageState
    extends State<AttendanceVerificationPage> {
  bool isComplete = false;
  bool isInit = false;
  Attendance attendance;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  Set<String> deviceIDSet = Set<String>();

  void initialize() {
    assert(!isInit);
    Duration remainingDuration = attendance.course.startTimestamp
        .add(Duration(minutes: attendance.course.attendanceDuration))
        .difference(DateTime.now());
    flutterBlue.startScan(timeout: remainingDuration);
    print('Starting Scan');
    BluetoothLE.startBleBeacon(attendance.attendanceId);
    print("Starting Beacon");
    NotificationsHandler.showBLENotification();
    Timer(remainingDuration, () {
      NotificationsHandler.cancelNotification(0);
      NotificationsHandler.showVerifiedNotification();
      setState(() {
        isComplete = true;
      });
    });
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    attendance = ModalRoute.of(context).settings.arguments;
    if (!isInit) initialize();
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(StringResources.cancelVerificationDialog),
              content: Text(StringResources.cancelVerificationBody),
              actions: [
                TextButton(
                    child: Text(StringResources.cancelAttendance),
                    onPressed: () {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName(HomePage.route));
                    }),
                TextButton(
                  child: Text(StringResources.continueVerification),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringResources.notifChannelName),
        ),
        body: !isComplete
            ? StreamBuilder<List<ScanResult>>(
                stream: flutterBlue.scanResults,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ScanResult>> snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    // Remove devices which are already kept in deviceIDSet Set
                    snapshot.data.removeWhere(
                        (result) => deviceIDSet.contains(result.device.id.id));

                    // Only keep devices which are broadcasting attendance ID with
                    // format ID****. Also remove entries which do not contain
                    // serviceData. This happens for some devices(lollipop) when
                    // scanning devices having Oreo+
                    snapshot.data.retainWhere((result) {
                      if (result.advertisementData.serviceData.isEmpty) {
                        return false;
                      }
                      return AsciiDecoder()
                          .convert(result.advertisementData.serviceData.entries
                              .first.value)
                          .startsWith("ID");
                    });

                    // Add newly discovered devies to the deviceIDSet Set. deviceIDSet
                    // is the set of all dicovered attendance peers
                    deviceIDSet.addAll(
                        snapshot.data.map((r) => r.device.id.id).toList());

                    List<int> attendanceIds = [];
                    // Extract string ID of newly discovered devices in ASCII bytes
                    // array and store in attendanceID list
                    attendanceIds = snapshot.data
                        .map((r) => int.parse(AsciiDecoder()
                            .convert(r.advertisementData.serviceData.entries
                                .first.value)
                            .substring(2)))
                        .toList();
                    // Create a list of futurs to call from the list of attendance ID
                    var futures = attendanceIds
                        .map((id) => AttendanceAPi.postBleVerification(id));
                    // Call all the futures from the list
                    Future.wait(futures);

                    return Center(
                      child: Text("Verified ${attendanceIds.length} devices"),
                    );
                  } else {
                    return Center(
                      child: Text("NO BLE"),
                    );
                  }
                },
              )
            : Center(
                child: Text(StringResources.done),
              ),
      ),
    );
  }
}
