import 'package:fase/data/usecase/auth_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthUsecase {
  AuthUsecase._();

  static final instance = AuthUsecaseImpl();

  User? get getCurrentUser;

  Future<User?> signInUser();

  Future<void> logOutUser();
}
