import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:fase/app/globals.dart';

import '../../../app/utils/interceptors/auth_interceptor.dart';
import '../../../app/utils/interceptors/header_interceptor.dart';
import '../../../app/utils/interceptors/request_logger.dart';
import '../../../domain/services/dio/dio_service.dart';

class FDioServiceImpl implements FDioService {
  late final Dio _dio;

  @override
  Dio get client => _dio;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future onStartUp(dynamic data) async {
    // Do nothing
    return;
  }

  @override
  Future<void> startUp() async {
    _dio = Dio(
      BaseOptions(baseUrl: Globals.baseURL),
    );

    _dio.interceptors.addAll([
      RequestLogger(),
      AuthHeader(),
      AuthStatusCode(),
    ]);

    // For accepting self signed certificates
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }
}
