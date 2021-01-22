import 'package:fase/utils/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: () {
            signInWithGoogle();
          },
        ),
      ),
    );
  }
}
