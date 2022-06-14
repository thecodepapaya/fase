import 'package:fase/device/repositories/remote_database/remote_database.dart';
import 'package:fase/domain/services/services.dart';

abstract class FRemoteDatabaseService implements FService {
  FRemoteDatabaseService._();

  static final instance = FRemoteDatabaseServiceImpl();

  Future<T?> read<T>({
    required String path,
    required T Function(Map?) decoder,
    required Map<String, Object?> Function(T) encoder,
  });
}
