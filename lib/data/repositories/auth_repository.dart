import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImply implements AuthRepository {
  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User?> loginWithCredentials(OAuthCredential credential) async {
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
}
