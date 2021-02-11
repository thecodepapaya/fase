import 'dart:convert';

import 'package:fase/models/attendance_data.dart';
import 'package:fase/models/course.dart';
import 'package:fase/models/registration_data.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = 'https://fase.centralindia.cloudapp.azure.com/';
const format = '?format=json';

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
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
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
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
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
