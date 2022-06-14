import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fase/domain/services/remote_database/remote_database_service.dart';

class FRemoteDatabaseServiceImpl implements FRemoteDatabaseService {
  late final FirebaseFirestore _databaseInstance;

  @override
  void onShutDown() async {
    await _databaseInstance.terminate();
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _databaseInstance = FirebaseFirestore.instance;
  }

  @override
  Future<T?> read<T>({
    required String path,
    required T Function(Map<String, dynamic>?) decoder,
    required Map<String, Object?> Function(T) encoder,
  }) async {
    final documentReference = _databaseInstance.doc(path);

    final mappedDocumentReference = documentReference.withConverter<T>(
      fromFirestore: (snapshot, _) => decoder(snapshot.data()),
      toFirestore: (accessPoint, _) => encoder(accessPoint),
    );

    final documentSnapshot = await mappedDocumentReference.get(); 

    final decodedData = documentSnapshot.data();

    return decodedData;
  }
}
