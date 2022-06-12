import '../../../device/repositories/file_download/file_download.dart';
import '../services.dart';

abstract class FFileDownloadService implements FService {
  FFileDownloadService._();

  static final instance = FFileDownloadServiceImpl();

  Future<void> download(String url);
}
