import 'package:auto_route/auto_route.dart';

import '../../../domain/usecases/auth_usecases.dart';
import '../../constants.dart';
import '../router/app_router.dart';

class EmailGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isIIITVEmail = AuthUsecase.instance.getCurrentFirebaseUser?.email?.endsWith(iiitvDomain) ?? false;

    if (isIIITVEmail) {
      resolver.next(true);
    } else {
      router.navigate(const ExternalEmailRoute());
    }
  }
}
