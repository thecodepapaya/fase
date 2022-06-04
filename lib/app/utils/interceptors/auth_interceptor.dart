// For checking 401 and 403

import 'dart:developer';

import 'package:dio/dio.dart';

class AuthStatusCode extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final isInvalidAuth = response.statusCode == 401 || response.statusCode == 403;

    if (isInvalidAuth) {
      log('Invalid JWT token, Logging out ...', name: 'AuthStatusCode');
      // TODO log the user out of the application here
    }

    return super.onResponse(response, handler);
  }
}
