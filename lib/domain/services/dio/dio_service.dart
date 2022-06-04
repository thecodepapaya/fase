import 'package:dio/dio.dart';

import '../../../device/repositories/dio/dio_service.dart';
import '../services.dart';

abstract class FDioService implements FService {
  FDioService._();

  static final instance = FDioServiceImpl();

  Dio get client;
}
