import 'package:fase/domain/repositories/google_sign_in_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepositoryImpl implements GoogleSignInRepository {
  @override
  Future<GoogleSignInAccount?> selectUserAccount() async {
    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );

    final googleSignInAccount = await googleSignIn.signIn();

    return googleSignInAccount;
  }

  @override
  Future<void> logOut() async {
    await GoogleSignIn().signOut();
  }
}
