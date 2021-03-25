import 'package:fase/ui/home_page.dart';
import 'package:fase/ui/loading_screen.dart';
import 'package:fase/ui/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHandler extends StatelessWidget {
  static const route = '/SignInHandler';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return LoadingScreen();
        } else {
          if (snapshot.hasData) {
            // if (snapshot.data.email.endsWith(StringResources.emailDomain)) {
            //TODO: add email validation for faculty and student
            // Globals.isFaculty = false;
            // Globals.isFaculty = true;
            return HomePage();
            // } else {
            //   return NotIIITVEmail();
            // }
          }
          return SignInScreen();
        }
      },
    );
  }
}
