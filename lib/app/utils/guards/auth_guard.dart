import 'package:auto_route/auto_route.dart';
import 'package:fase/app/app.dart';
import 'package:fase/domain/usecases/firebase_auth_usecases.dart';

import '../router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = FirebaseAuthUsecase.instance.getCurrentFirebaseUser != null;

    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (isAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.navigate(
        LoginRoute(
          onSuccess: () {
            // Redirect to next view if login succeeds
            resolver.next(true);
            // Remove last login route from stack so that the user can't accidentally go back to it
            appRouter.removeLast();
          },
        ),
      );
    }
  }
}
