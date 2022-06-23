import 'dart:async';

import 'package:fase/domain/services/error_reporting/error_reporting_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FErrorReportingService.instance.startUp().then((dynamic data) {
      FErrorReportingService.instance.onStartUp(data);
    });

    runApp(
      const ProviderScope(
        child: FaseApp(),
      ),
    );
  }, (error, stack) {
    // This would only report errors occurring after start-up process since Firebase is not initialized
    // until start-up
    FErrorReportingService.instance.onError(exception: error, stackTrace: stack);
  });
}
