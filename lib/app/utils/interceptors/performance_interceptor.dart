import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

/// For measuring API request performance for all requests
class NetworkPerformance extends Interceptor {
  HttpMetric? metric;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    metric = FirebasePerformance.instance.newHttpMetric(
      options.uri.toString(),
      options.method.toHttpMethod,
    );

    await metric?.start();

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    metric?.httpResponseCode = response.statusCode;
    metric?.putAttribute('message', response.statusMessage ?? '');

    await metric?.stop();

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    metric?.httpResponseCode = err.response?.statusCode;
    metric?.putAttribute('message', err.message);

    await metric?.stop();

    return super.onError(err, handler);
  }
}

extension on String {
  HttpMethod get toHttpMethod {
    late final HttpMethod method;

    switch (this) {
      case 'GET':
        method = HttpMethod.Get;
        break;
      case 'POST':
        method = HttpMethod.Post;
        break;
      case 'PATCH':
        method = HttpMethod.Patch;
        break;
      case 'PUT':
        method = HttpMethod.Put;
        break;
      case 'CONNECT':
        method = HttpMethod.Connect;
        break;
      case 'DELETE':
        method = HttpMethod.Delete;
        break;
      case 'HEAD':
        method = HttpMethod.Head;
        break;
      case 'OPTIONS':
        method = HttpMethod.Options;
        break;
      case 'TRACE':
        method = HttpMethod.Trace;
        break;
    }

    return method;
  }
}
