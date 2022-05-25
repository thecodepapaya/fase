import 'package:fase/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  AuthRepository._();

  static final instance = AuthRepositoryImply();

  User? get currentUser;

  Future<User?> loginWithCredentials(OAuthCredential credential);

  Future<void> logOut();
}
