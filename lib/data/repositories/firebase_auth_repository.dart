import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User?> firebaseLoginWithCredentials(OAuthCredential credential) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      log('Logged in User: ${user?.email}', name: 'AuthRepositoryImply.loginWithGoogle');

      return user;
    } catch (error) {
      log(error.toString());

      return null;
    }
  }

  @override
  Future<String?> jwtToken() async {
    final token = await currentUser?.getIdToken(true);

    return token;
  }
}
