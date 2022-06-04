import 'dart:developer';

import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/authentication_endpoints.dart';
import 'package:fase/domain/entities/user.dart';
import 'package:fase/domain/repositories/authentication_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<User?> login() async {
    try {
      final response = await FDioService.instance.client.get(AuthenticationEndpoints.login);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final user = User.fromMap(response.data);
        return user;
      }
    } catch (error, stackTrace) {
      log(AuthenticationEndpoints.login, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }
}
