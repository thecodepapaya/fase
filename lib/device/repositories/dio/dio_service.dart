import 'package:dio/dio.dart';
import 'package:fase/domain/repositories/firebase_auth_repository.dart';

import '../../../domain/services/dio/dio_service.dart';

class FDioServiceImpl implements FDioService {
  late final Dio _dio;

  // final _headers = {
  //   'Authorization': 'Bearer ${FirebaseAuthRepository.instance.currentUser?.getIdToken()}',
  // };

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
    _dio = Dio();
  }
}
