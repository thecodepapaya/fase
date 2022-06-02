import 'package:fase/domain/entities/attendance.dart';
import 'package:fase/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<List<Attendance>> getAttendanceList(int courseId) {
    // TODO: implement getAttendanceList
    throw UnimplementedError();
  }

  @override
  Future<Attendance> markAttendance(int courseId) {
    // TODO: implement markAttendance
    throw UnimplementedError();
  }
}
