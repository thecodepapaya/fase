import 'package:fase/device/repositories/analytics/analytics.dart';
import 'package:fase/domain/services/services.dart';

abstract class FAnalyticsService implements FService {
  FAnalyticsService._();

  static final instance = FAnalyticsServiceImpl();

  void onEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  });
}
