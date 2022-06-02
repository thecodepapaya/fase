import 'package:fase/data/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  AuthRepository._();

  static final instance = AuthRepositoryImply();

  User? get currentUser;

  Future<User?> firebaseLoginWithCredentials(OAuthCredential credential);

  Future<String?> jwtToken();

  Future<void> logOut();
}
