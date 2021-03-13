import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(FirebaseAuth.instance.currentUser.displayName),
            accountEmail: Text(FirebaseAuth.instance.currentUser.email),
            currentAccountPicture: ClipOval(
              child: Image.network(FirebaseAuth.instance.currentUser.photoURL),
            ),
          ),
          ListTile(
            title: Text(
              Globals.isFaculty
                  ? StringResources.loginAsFaculty
                  : StringResources.loginAsStudent,
            ),
          ),
          ListTile(
            title: Text(StringResources.signOut),
            trailing: Icon(Icons.logout),
            onTap: () {
              FirebaseAuth.instance.signOut();
              GoogleSignIn().signOut();
            },
          ),
        ],
      ),
    );
  }
}
