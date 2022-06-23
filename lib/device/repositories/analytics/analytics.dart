import 'dart:async';

import 'package:fase/domain/services/analytics/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FAnalyticsServiceImpl implements FAnalyticsService {
  late final FirebaseAnalytics _analytics;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    _analytics.logAppOpen();
  }

  @override
  Future<void> startUp() async {
    _analytics = FirebaseAnalytics.instance;
  }

  @override
  void onEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) {
    _analytics.logEvent(name: eventName, parameters: properties);
  }
}
