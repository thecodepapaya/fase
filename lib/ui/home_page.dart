import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/api.dart';
import 'package:fase/utils/location_permission.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LocationPermission(context).requestPermisson();
    // Globals().secureStorage.containsKey(key: StringResources.serverKey);
    // CourseApi().getCourses();
    // RegistrationAPi().postRegistration();
    // RegistrationAPi().getRegistration();
    // AttendanceAPi().getAttendance();
    // AttendanceAPi().postAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.fase),
      ),
      // body: Center(
      //   child: ,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // http.Response response = await http.get(
          //     'https://fase.centralindia.cloudapp.azure.com/course/?format=json');
          // print("Response: ${response.body}");
          // print("Response: ${response.statusCode}");
          CourseApi().getCourses();
        },
        child: Icon(Icons.wifi),
      ),
    );
  }
}
