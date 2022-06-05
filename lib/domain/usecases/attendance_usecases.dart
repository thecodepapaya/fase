import 'package:fase/data/usecase/attendance_usecases.dart';
import 'package:fase/domain/entities/attendance.dart';

abstract class AttendanceUsecases {
  AttendanceUsecases._();

  static final instance = AttendanceUsecasesImpl();

  Future<bool> markAttendance(int courseId);

  Future<List<Attendance>> attendanceList(int courseId);
}
