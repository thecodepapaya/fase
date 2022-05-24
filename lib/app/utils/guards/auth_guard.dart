import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    debugPrint('onNavigation');
    final authenticated = await Future.delayed(const Duration(seconds: 3), () {
      return true;
    });

    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(const LoginRoute());
      // router.push(LoginRoute(onResult: (success) {
      //   // if success == true the navigation will be resumed
      //   // else it will be aborted
      //   resolver.next(success);
      // }));
    }
  }
}
