import 'package:fase/app/globals.dart';
import 'package:fase/app/utils/profile/profile.dart';
import 'package:fase/domain/entities/user.dart';
import 'package:fase/domain/repositories/authentication_repository.dart';
import 'package:fase/domain/usecases/auth_usecases.dart';

class AuthUsecaseImpl implements AuthUsecase {
  @override
  Future<User?> login() async {
    final user = await AuthenticationRepository.instance.login();

    if (user != null) {
      Globals.profile = user;
    }

    return user;
  }

  @override
  void logOut() {
    Globals.profile = Profile.dummy();
  }
}
