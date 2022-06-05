import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fase/domain/usecases/firebase_auth_usecases.dart';

/// For checking 401 and 403
class AuthStatusCode extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final isInvalidAuth = response.statusCode == 401 || response.statusCode == 403;

    if (isInvalidAuth) {
      log('Invalid JWT token, Logging out ...', name: 'AuthStatusCode');
      await FirebaseAuthUsecase.instance.logOutUser();
    }

    return super.onResponse(response, handler);
  }
}
