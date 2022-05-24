import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/router/app_router.dart';

final appRouter = AppRouter();

class FaseApp extends ConsumerWidget {
  const FaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _ = ref.watch(startUpProvider);

    return MaterialApp.router(
      title: 'Fase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      themeMode: ThemeMode.system,
    );
  }
}
