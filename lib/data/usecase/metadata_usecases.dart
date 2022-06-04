import 'package:fase/domain/entities/metadata.dart';
import 'package:fase/domain/repositories/meta_data_repository.dart';
import 'package:fase/domain/usecases/metadata_usecases.dart';

class MetadataUsecaseImpl implements MetadataUsecase {
  @override
  Future<Metadata?> getMetadata() async {
    final metadata = await MetadataRepository.instance.getMetadata();

    return metadata;
  }

  @override
  Future<bool> pingServer() async {
    final successfulPing = await MetadataRepository.instance.pingServer();

    return successfulPing;
  }
}
