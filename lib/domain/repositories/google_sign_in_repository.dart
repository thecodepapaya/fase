import 'package:google_sign_in/google_sign_in.dart';

import '../../data/repositories/google_sign_in_repository.dart';

abstract class GoogleSignInRepository {
  GoogleSignInRepository._();

  static final instance = GoogleSignInRepositoryImpl();

  Future<GoogleSignInAccount?> selectUserAccount();

  Future<void> logOut();
}
