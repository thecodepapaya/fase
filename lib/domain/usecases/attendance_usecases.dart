import 'package:fase/data/usecase/attendance_usecases.dart';

abstract class AttendanceUsecases {
  AttendanceUsecases._();

  static final instance = AttendanceUsecasesImpl();

  Future<bool> markAttendance(int courseId);

  Future<bool> downloadAttendanceSpreadsheet(int courseId);
}
