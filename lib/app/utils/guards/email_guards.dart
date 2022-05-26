import 'package:auto_route/auto_route.dart';

import '../../../domain/usecases/auth_usecases.dart';
import '../../constants.dart';
import '../router/app_router.dart';

class EmailGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

    final isIIITVEmail = AuthUsecase.instance.getCurrentUser?.email?.endsWith(iiitvDomain) ?? false;

    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (isIIITVEmail) {
      // if user has IIITV email, we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(const ExternalEmailRoute());
      // router.push(LoginRoute(onResult: (success) {
      //   // if success == true the navigation will be resumed
      //   // else it will be aborted
      //   resolver.next(success);
      // }));
    }
  }
}
