import 'package:fase/data/usecase/firebase_auth_usecases.dart';
import 'package:fase/domain/entities/user.dart' as domain;
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthUsecase {
  FirebaseAuthUsecase._();

  static final instance = FirebaseAuthUsecaseImpl();

  User? get getCurrentFirebaseUser;

  Future<domain.User?> signInUser();

  Future<void> logOutUser();
}
