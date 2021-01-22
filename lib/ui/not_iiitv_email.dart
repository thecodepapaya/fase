import 'package:fase/string_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotIIITVEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Not IIITV"),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(StringsResource.signOut),
            ),
          ],
        ),
      ),
    );
  }
}
