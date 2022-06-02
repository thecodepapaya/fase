import 'package:fase/domain/entities/attendance.dart';

abstract class AttendanceRepository {
  Future<Attendance> markAttendance(int courseId);

  Future<List<Attendance>> getAttendanceList(int courseId);
}
