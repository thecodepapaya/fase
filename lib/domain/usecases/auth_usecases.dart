import 'package:fase/data/usecase/auth_usecases.dart';
import 'package:fase/domain/entities/user.dart';

abstract class AuthUsecase {
  AuthUsecase._();

  static final instance = AuthUsecaseImpl();

  Future<User?> login();

  void logOut();
}
