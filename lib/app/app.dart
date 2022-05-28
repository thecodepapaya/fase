import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/splash/view.dart';
import 'utils/router/app_router.dart';

final appRouter = AppRouter();

class FaseApp extends ConsumerWidget {
  const FaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _ = ref.watch(startUpProvider);

    return MaterialApp.router(
      title: 'Fase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(
          // navigatorObservers: () => [
          //   MyNavigatorObserver(),
          // ],
          ),
      routeInformationParser: appRouter.defaultRouteParser(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}

// class MyNavigatorObserver extends NavigatorObserver {
//   final routeStack = <Route<dynamic>>[];

//   _printRouteStack() {
//     // log('Route stack : ${routeStack.join()}');
//   }

//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     log('didPush : $route');
//     routeStack.add(route);
//     _printRouteStack();
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     log('didPop : $route');
//     routeStack.removeLast();
//     _printRouteStack();
//   }

//   @override
//   void didRemove(Route route, Route? previousRoute) {
//     log('didRemove : $route');
//     routeStack.removeLast();
//     _printRouteStack();
//   }

//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     log('didReplace : $newRoute');
//     routeStack.removeLast();
//     // routeStack.add(newRoute);
//     _printRouteStack();
//   }
// }
