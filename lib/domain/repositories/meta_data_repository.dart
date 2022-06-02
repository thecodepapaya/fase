import 'package:fase/domain/entities/metadata.dart';

abstract class MetadataRepository {
  Future<Metadata> getMetadata();
}
