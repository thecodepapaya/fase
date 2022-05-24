import 'package:flutter/material.dart';

import 'utils/router/app_router.dart';

class FaseApp extends StatelessWidget {
  FaseApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      themeMode: ThemeMode.system,
    );
  }
}
