import 'dart:developer';

import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/entities/metadata.dart';
import 'package:fase/domain/repositories/meta_data_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class MetadataRepositoryImpl implements MetadataRepository {
  @override
  Future<Metadata?> getMetadata() async {
    const endPoint = Endpoints.getMetadata;

    try {
      final response = await FDioService.instance.client.get(endPoint);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      if (isSuccess) {
        final metadata = Metadata.fromMap(response.data);
        return metadata;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }

  @override
  Future<bool> pingServer() async {
    const endPoint = Endpoints.pingServer;

    try {
      final response = await FDioService.instance.client.get(endPoint);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      return isSuccess;
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return false;
    }
  }
}
