import 'dart:async';
import 'dart:convert';

import 'package:fase/models/attendance_data.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/api.dart';
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
  Attendance attendance;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  Set<String> deviceIDSet = Set<String>();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() {
    //TODO set duration from course start time and attendance duration
    flutterBlue.startScan(timeout: Duration(minutes: 10));
    print('Starting Scan');
    NotificationsHandler.showBLENotification();
  }

  @override
  Widget build(BuildContext context) {
    attendance = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringResources.notifChannelName),
        ),
        body: StreamBuilder<List<ScanResult>>(
          stream: flutterBlue.scanResults,
          builder:
              (BuildContext context, AsyncSnapshot<List<ScanResult>> snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              snapshot.data.removeWhere(
                  (result) => deviceIDSet.contains(result.device.id.id));
              deviceIDSet
                  .addAll(snapshot.data.map((e) => e.device.id.id).toList());

              List<int> attendanceIds = [];
              attendanceIds = snapshot.data
                  .map((r) => int.parse(AsciiDecoder()
                      .convert(
                          r.advertisementData.serviceData.entries.first.value)
                      .substring(2)))
                  .toList();
              var futures = attendanceIds
                  .map((e) => AttendanceAPi.postBleVerification(e));
              Future.wait(futures); // print(AsciiDecoder()
              //     .convert(scanResultSet
              //         .first.advertisementData.serviceData.entries.first.value)
              //     .substring(2));
              //#####
              return SingleChildScrollView(
                child: Column(
                  children: deviceIDSet
                      .map(
                        (r) => ListTile(
                          title: Text(r),
                          // subtitle:
                          //     Text(r.advertisementData.serviceData.toString()),
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return Center(
                child: Text("NO BLE"),
              );
            }
          },
        ),
      ),
    );
  }
}
