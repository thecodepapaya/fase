import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const route = '/signInScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(StringResources.signIn),
              onPressed: () {
                Globals.isFaculty = false;
                signInWithGoogle();
              },
            ),
            //TODO this button must be removed
            SizedBox(height: 40),
            ElevatedButton(
              child: Text(StringResources.signIn + ' as faculty'),
              onPressed: () {
                Globals.isFaculty = true;
                signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
