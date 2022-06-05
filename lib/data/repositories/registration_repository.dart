import 'dart:developer';

import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/entities/registration.dart';
import 'package:fase/domain/repositories/registration_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  @override
  Future<Registration?> register(Registration registration) async {
    const endPoint = Endpoints.register;
    final payload = registration.toMap();

    try {
      final response = await FDioService.instance.client.post(endPoint, data: payload);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final registration = Registration.fromMap(response.data);
        return registration;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }

  @override
  Future<Registration?> verifyRegistration(String deviceID) async {
    const endPoint = Endpoints.verifyRegistration;
    final payload = <String, String>{'device_id': deviceID};

    try {
      final response = await FDioService.instance.client.post(endPoint, data: payload);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final registration = Registration.fromMap(response.data);
        return registration;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }
}
