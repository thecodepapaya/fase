import '../../../device/repositories/secure_storage/secure_storage.dart';
import '../services.dart';

abstract class FSecureStorageService implements FService {
  FSecureStorageService._();

  static final instance = FSecureStorageServiceImpl();

  String get secureAuthKey;
  set secureAuthKey(String value);
}
