import 'package:fase/data/usecase/metadata_usecases.dart';
import 'package:fase/domain/entities/metadata.dart';

@Deprecated('IDK why I created this')
abstract class MetadataUsecase {
  MetadataUsecase._();

  static final instance = MetadataUsecaseImpl();

  Future<Metadata?> getMetadata();

  Future<bool> pingServer();
}
