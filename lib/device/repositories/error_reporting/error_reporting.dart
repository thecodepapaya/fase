import 'dart:developer';

import 'package:fase/domain/services/error_reporting/error_reporting_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class FErrorReportingServiceImpl implements FErrorReportingService {
  late final FirebaseCrashlytics _crashlytics;

  @override
  void onShutDown() {
    _crashlytics.sendUnsentReports();
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    FlutterError.onError = _crashlytics.recordFlutterError;
  }

  @override
  Future<void> startUp() async {
    _crashlytics = FirebaseCrashlytics.instance;
  }

  @override
  Future<void> onError({required Object exception, StackTrace? stackTrace}) async {
    log('Reporting error $exception', name: 'FErrorReportingService.onError');
    await _crashlytics.recordError(exception, stackTrace);
  }
}
