import 'dart:developer';

import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/entities/user.dart';
import 'package:fase/domain/repositories/authentication_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<User?> login() async {
    const endPoint = Endpoints.login;

    try {
      final response = await FDioService.instance.client.post(endPoint);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final user = User.fromMap(response.data);
        return user;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }
}
