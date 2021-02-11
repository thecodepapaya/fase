import 'package:fase/string_resource.dart';
import 'package:fase/utils/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(StringResources.signIn),
          onPressed: () {
            signInWithGoogle();
          },
        ),
      ),
    );
  }
}
