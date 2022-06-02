import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/firebase_auth_repository.dart';
import '../../domain/repositories/google_sign_in_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

class AuthUsecaseImpl implements AuthUsecase {
  @override
  User? get getCurrentUser => AuthRepository.instance.currentUser;

  @override
  Future<User?> signInUser() async {
    log('', name: 'AuthUsecase.signInUser');

    final googleSignInAccount = await GoogleSignInRepository.instance.selectUserAccount();

    final googleSignInAuthentication = await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final user = await AuthRepository.instance.firebaseLoginWithCredentials(credential);

    return user;
  }

  @override
  Future<void> logOutUser() async {
    log('', name: 'AuthUsecase.logOutUser');

    await GoogleSignInRepository.instance.logOut();
    await AuthRepository.instance.logOut();
  }
}
