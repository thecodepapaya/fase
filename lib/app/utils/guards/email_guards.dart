import 'package:auto_route/auto_route.dart';
import 'package:fase/app/globals.dart';

import '../../../domain/usecases/firebase_auth_usecases.dart';
import '../router/app_router.dart';

class EmailGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isIIITVEmail = FirebaseAuthUsecase.instance.getCurrentFirebaseUser?.email?.endsWith(Globals.iiitvDomain) ?? false;

    if (isIIITVEmail) {
      resolver.next(true);
    } else {
      router.navigate(const ExternalEmailRoute());
    }
  }
}
