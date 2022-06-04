import 'package:fase/domain/entities/metadata.dart';

import '../../data/repositories/meta_data_repository.dart';

abstract class MetadataRepository {
  MetadataRepository._();

  static final instance = MetadataRepositoryImpl();

  Future<Metadata?> getMetadata();

  Future<bool> pingServer();
}
