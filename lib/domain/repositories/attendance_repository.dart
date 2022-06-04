import 'package:fase/domain/entities/attendance.dart';

import '../../data/repositories/attendance_repository.dart';

abstract class AttendanceRepository {
  AttendanceRepository._();

  static final instance = AttendanceRepositoryImpl();

  Future<Attendance> markAttendance(int courseId);

  Future<List<Attendance>> getAttendanceList(int courseId);
}
