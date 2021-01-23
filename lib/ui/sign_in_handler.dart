import 'package:fase/string_resource.dart';
import 'package:fase/ui/home_page.dart';
import 'package:fase/ui/loading_screen.dart';
import 'package:fase/ui/not_iiitv_email.dart';
import 'package:fase/ui/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHandler extends StatelessWidget {
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
            print("displayName: ${snapshot.data.displayName}");
            print("email: ${snapshot.data.email}");
            print("uid: ${snapshot.data.uid}");
            if (snapshot.data.email.endsWith(StringsResource.emailDomain)) {
              return HomePage();
            } else {
              return NotIIITVEmail();
            }
          }
          return SignInScreen();
        }
      },
    );
  }
}