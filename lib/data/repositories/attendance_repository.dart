import 'dart:developer';

import 'package:fase/app/globals.dart';
import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/entities/attendance.dart';
import 'package:fase/domain/repositories/attendance_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<List<Attendance>?> getAttendanceList(int courseId) {
    // TODO: implement getAttendanceList
    throw UnimplementedError();
  }

  @override
  Future<Attendance?> markAttendance(int courseId) async {
    const endPoint = Endpoints.markAttendance;
    final payload = <String, dynamic>{
      'course': courseId,
      'student': Globals.profile.instituteEmail,
      'registration': Globals.registration?.id ?? '',
    };

    try {
      final response = await FDioService.instance.client.post(endPoint, data: payload);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final attendance = Attendance.fromMap(response.data);
        return attendance;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }
}
