import 'dart:developer';

import 'package:fase/app/globals.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/repositories/attendance_repository.dart';
import 'package:fase/domain/repositories/firebase_auth_repository.dart';
import 'package:fase/domain/usecases/attendance_usecases.dart';
import 'package:url_launcher/url_launcher.dart';

class AttendanceUsecasesImpl implements AttendanceUsecases {
  @override
  Future<bool> markAttendance(int courseId) async {
    final attendance = await AttendanceRepository.instance.markAttendance(courseId);

    final isSuccessfullyMarked = attendance != null;

    return isSuccessfullyMarked;
  }

  @override
  Future<bool> downloadAttendanceSpreadsheet(int courseId) async {
    bool isDownloaded = false;
    final downloadUrl = '${Globals.baseURL}${Endpoints.downloadAttendanceSpreadsheet(courseId)}';

    try {
      final token = await FirebaseAuthRepository.instance.currentUser?.getIdToken();

      final header = {'Authorization': 'Bearer $token'};

      isDownloaded = await launchUrl(
        Uri.parse(downloadUrl),
        mode: LaunchMode.externalApplication,
        webViewConfiguration: WebViewConfiguration(
          headers: header,
        ),
      );
    } catch (e, st) {
      isDownloaded = false;
      log('Error launching url: $e', stackTrace: st);
    }

    return isDownloaded;
  }
}
