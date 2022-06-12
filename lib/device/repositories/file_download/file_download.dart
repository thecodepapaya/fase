import 'package:fase/domain/services/file_download/file_download_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class FFileDownloadServiceImpl implements FFileDownloadService {
  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
    return;
  }

  @override
  Future<void> startUp() async {
    await FlutterDownloader.initialize(debug: kDebugMode);
  }

  @override
  Future<void> download(String url) async {
    throw UnimplementedError('Not using downloader for downloading attendance spreadsheet');
    // await FlutterDownloader.enqueue(
    //   url: url,
    //   savedDir: 'the path of directory where you want to save downloaded files',
    // );
  }
}
