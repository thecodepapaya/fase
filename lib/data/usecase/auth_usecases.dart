import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user.dart' as domain;
import '../../domain/repositories/authentication_repository.dart' as fase_auth;
import '../../domain/repositories/firebase_auth_repository.dart';
import '../../domain/repositories/google_sign_in_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

class AuthUsecaseImpl implements AuthUsecase {
  @override
  User? get getCurrentFirebaseUser => FirebaseAuthRepository.instance.currentUser;

  @override
  Future<domain.User?> signInUser() async {
    log('', name: 'AuthUsecase.signInUser');
    late final domain.User? user;

    final googleSignInAccount = await GoogleSignInRepository.instance.selectUserAccount();

    final googleSignInAuthentication = await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final firebaseUser = await FirebaseAuthRepository.instance.firebaseLoginWithCredentials(credential);

    if (firebaseUser != null) {
      // Do fase login only if firebase login succeeds
      user = await fase_auth.AuthenticationRepository.instance.login();
    }

    return user;
  }

  @override
  Future<void> logOutUser() async {
    log('', name: 'AuthUsecase.logOutUser');

    await GoogleSignInRepository.instance.logOut();
    await FirebaseAuthRepository.instance.logOut();
  }
}
