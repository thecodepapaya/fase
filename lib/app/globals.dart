import 'package:fase/app/app.dart';
import 'package:fase/app/utils/profile/profile.dart';
import 'package:fase/domain/entities/registration.dart';
import 'package:flutter/material.dart';

class Globals {
  Globals._();

  static const baseURL = 'https://fase.thecodepapaya.dev';
  static const iiitvDomain = 'iiitvadodara.ac.in';

  static var profile = Profile.dummy();

  static Registration? registration;

  static final context = appRouter.navigatorKey.currentContext;

  static void showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));

    if (context != null) ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
}
