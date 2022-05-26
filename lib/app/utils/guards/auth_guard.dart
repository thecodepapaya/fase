import 'package:auto_route/auto_route.dart';
import 'package:fase/domain/usecases/auth_usecases.dart';

import '../router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = AuthUsecase.instance.getCurrentUser != null;

    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (isAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(
        LoginRoute(
          onSuccess: () {
            // Redirect to next view if login succeeds
            resolver.next(true);
          },
        ),
      );
    }
  }
}
