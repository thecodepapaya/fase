import 'package:fase/models/metadata.dart';
import 'package:fase/utils/api.dart';
import 'package:flutter/cupertino.dart';

class MetadataProvider extends ChangeNotifier {
  Metadata get metadata => _metadata;
  bool get ping => _canPing;

  bool _canPing = false;

  static Metadata _metadata = Metadata(
    minAppBuild: -1,
    minAppVersion: 'v0.0.0',
  );

  void tryPing() async {
    await MetadataApi.getPing();
    notifyListeners();
  }

  void getMetadata() async {
    _metadata = await MetadataApi.getMetadata();
    notifyListeners();
  }
}
