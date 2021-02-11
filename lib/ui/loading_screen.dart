import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const route = '/loadingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading ... "),
      ),
    );
  }
}
