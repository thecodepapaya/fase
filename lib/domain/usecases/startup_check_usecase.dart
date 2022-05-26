import 'package:fase/data/usecase/startup_check_usecase.dart';

abstract class StartUpCheckUsecase {
  StartUpCheckUsecase._();

  static final instance = StartUpCheckUsecaseImpl();

  Future<bool> checkIfPhysicalDevice();

  Future<bool> checkIfUnRooted();

  Future<bool> checkIfLocationGranted();

  Future<bool> checkIfLocationEnabled();

  Future<bool> checkIfWifiConnected();

  Future<bool> checkIfIIITVWifiConnected();

  Future<bool> checkCanPingServer();

  Future<bool> checkAppUpToDate();

  Future<bool> checkRegistrationValid();
}
