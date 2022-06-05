import 'package:fase/domain/entities/attendance.dart';
import 'package:fase/domain/usecases/attendance_usecases.dart';

class AttendanceUsecasesImpl implements AttendanceUsecases {
  @override
  Future<List<Attendance>> attendanceList(int courseId) {
    // TODO: implement attendanceList
    throw UnimplementedError();
  }

  @override
  Future<bool> markAttendance(int courseId) {
    // TODO: implement markAttendance
    throw UnimplementedError();
  }
}
