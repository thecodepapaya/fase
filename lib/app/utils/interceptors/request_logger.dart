// Logging all requests and response to console for debugging

import 'dart:developer';

import 'package:dio/dio.dart';

class RequestLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('[${options.method}] ${options.path}', name: 'REQ');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[${response.statusCode}] ${response.requestOptions.path}', name: 'RES');
    // handler.next(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('[${err.response?.statusCode}] ${err.requestOptions.path}', name: 'ERR');
    return super.onError(err, handler);
  }
}
