import 'dart:convert';

import 'package:fase/globals.dart';
import 'package:fase/models/attendance_data.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/metadata.dart';
import 'package:fase/models/registration_data.dart';
import 'package:fase/string_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = 'https://fase.centralindia.cloudapp.azure.com/';
const format = '?format=json';
const postHeader = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

class MetadataApi {
  static const _endpoint = 'meta/';

  static Future<Metadata> getMetadata() async {
    http.Response response = await http.get(BASE_URL + _endpoint + format);
    Metadata metadata = Metadata.fromRawJson(response.body);
    return metadata;
  }
}

class CourseApi {
  static const _endpoint = 'course/';

  static Future<List<Course>> getCourses() async {
    http.Response response = await http.get(BASE_URL + _endpoint + format);
    List<Course> courses = [];
    json.decode(response.body).forEach((courseJson) {
      courses.add(Course.fromJson(courseJson));
    });
    return courses;
  }
}

class RegistrationAPi {
  static const _endpoint = 'registration/';
  static const _verification = 'verify/';

  // static RegistrationData _registrationData = RegistrationData(
  //   studentData: StudentData(
  //       instituteEmail: 'instituteEmail', googleUid: 'googleUid', name: 'name'),
  //   timestamp: DateTime.now(),
  //   deviceId: 'deviceId',
  //   isPhysical: true,
  //   isRooted: false,
  //   fingerprint: 'fingerprint',
  //   sdkInt: 28,
  //   appVersionString: 'v0.0.1',
  //   appBuildNumber: 2,
  //   ssid: 'ssid',
  //   bssid: 'bssid',
  //   localIp: 'localIp',
  // );

  static Future<Registration> postRegistration(
      Registration registrationData) async {
    http.Response response = await http.post(
      BASE_URL + _endpoint,
      body: registrationData.toRawJson(),
      headers: postHeader,
    );
    Registration data = Registration.fromRawJson(response.body);
    return data;
  }

  static Future<List<Registration>> getRegistration() async {
    http.Response response = await http.get(BASE_URL + _endpoint + format);
    List<Registration> registration = [];
    json.decode(response.body).forEach((registrationJson) {
      registration.add(Registration.fromJson(registrationJson));
    });
    return registration;
  }

  static Future<bool> isRegistrationValid() async {
    final email = FirebaseAuth.instance.currentUser.email;
    final serverKey = await Globals.secureStorage.read(
      key: StringResources.serverKey,
    );
    http.Response response = await http.post(
      BASE_URL + _endpoint + _verification,
      headers: postHeader,
      body: json.encode({
        'institute_email': email,
        'server_key': serverKey,
      }),
    );
    if (response.statusCode == 200)
      return true;
    else
      return false;
    // switch (response.statusCode) {
    //   case 200:
    //     return true;
    //   case 404:
    //     return false;
    //   case 400:
    //     return false;
    //   case 500:
    //     return false;
    //   default:
    //     return false;
    // }
  }
}

class AttendanceAPi {
  static const _endpoint = 'attendance/';

  // static Attendance _attendanceData = Attendance(
  //   studentData: StudentData(
  //     instituteEmail: 'instituteEmail',
  //     googleUid: 'googleUid',
  //     name: 'name',
  //   ),
  //   deviceId: 'deviceId',
  //   isPhysical: true,
  //   isRooted: false,
  //   fingerprint: 'fingerprint',
  //   sdkInt: 28,
  //   appVersionString: 'v0.0.1',
  //   appBuildNumber: 2,
  //   ssid: 'ssid',
  //   bssid: 'bssid',
  //   localIp: 'localIp',
  //   course: Course(
  //     courseCode: 'courseName',
  //     courseName: 'courseName',
  //     instructorName: 'instructorName',
  //   ),
  //   serverKey: "366f2a61058b6e49cc3c3b49ff6ffd0d175c33f3",
  // );

  static Future<Attendance> postAttendance(Attendance attendanceData) async {
    http.Response response = await http.post(
      BASE_URL + _endpoint,
      body: attendanceData.toRawJson(),
      headers: postHeader,
    );
    Attendance data = Attendance.fromRawJson(response.body);
    return data;
  }

  static Future<List<Attendance>> getAttendance() async {
    http.Response response = await http.get(BASE_URL + _endpoint + format);
    List<Attendance> attendance = [];
    json.decode(response.body).forEach((attendanceJson) {
      attendance.add(Attendance.fromJson(attendanceJson));
    });
    return attendance;
  }
}
