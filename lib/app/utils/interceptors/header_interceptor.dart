// For adding Authorization header to all requests

import 'package:dio/dio.dart';
import 'package:fase/domain/repositories/firebase_auth_repository.dart';

class AuthHeader extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await FirebaseAuthRepository.instance.currentUser?.getIdToken();

    final header = {'Authorization': 'Bearer $token'};

    options.headers.addAll(header);

    return super.onRequest(options, handler);
  }
}
