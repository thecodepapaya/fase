import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/services/secure_storage/secure_storage_service.dart';

class FSecureStorageServiceImpl implements FSecureStorageService {
  FlutterSecureStorage? _storage;
  String? _secureAuthKey;

  @override
  String get secureAuthKey => _secureAuthKey ?? '';

  @override
  void onShutDown() {
    // DO nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    //Do nothing
  }

  @override
  Future<void> startUp() async {
    _storage = const FlutterSecureStorage();
    _secureAuthKey = await _storage?.read(key: 'auth_key');
  }
}
