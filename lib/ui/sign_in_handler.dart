import 'package:fase/ui/home_page.dart';
import 'package:fase/ui/loading_screen.dart';
import 'package:fase/ui/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return LoadingScreen();
        } else {
          if (snapshot.hasData) {
            return HomePage();
          }
          return SignInScreen();
        }
      },
    );
  }
}
