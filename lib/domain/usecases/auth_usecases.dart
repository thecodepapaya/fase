import 'package:fase/data/usecase/auth_usecases.dart';
import 'package:fase/domain/entities/user.dart' as domain;
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthUsecase {
  AuthUsecase._();

  static final instance = AuthUsecaseImpl();

  User? get getCurrentFirebaseUser;

  Future<domain.User?> signInUser();

  Future<void> logOutUser();
}
