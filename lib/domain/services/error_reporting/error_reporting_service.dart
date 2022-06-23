import 'package:fase/device/repositories/error_reporting/error_reporting.dart';

import '../services.dart';

abstract class FErrorReportingService implements FService {
  FErrorReportingService._();

  static final instance = FErrorReportingServiceImpl();

  Future<void> onError({required Object exception, StackTrace? stackTrace});
}
