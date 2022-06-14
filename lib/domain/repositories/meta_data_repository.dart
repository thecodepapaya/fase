import 'package:fase/domain/entities/access_point.dart';
import 'package:fase/domain/entities/metadata.dart';

import '../../data/repositories/meta_data_repository.dart';

abstract class MetadataRepository {
  MetadataRepository._();

  static final instance = MetadataRepositoryImpl();

  Future<Metadata?> getMetadata();

  Future<bool> pingServer();

  Future<AccessPoint?> getAccessPointData();
}
