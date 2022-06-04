import 'package:fase/data/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  FirebaseAuthRepository._();

  static final instance = FirebaseAuthRepositoryImpl();

  User? get currentUser;

  Future<User?> firebaseLoginWithCredentials(OAuthCredential credential);

  Future<String?> jwtToken();

  Future<void> logOut();
}
