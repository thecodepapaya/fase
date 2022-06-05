import 'package:fase/data/usecase/system_check_usecases.dart';

abstract class SystemCheckUsecase {
  SystemCheckUsecase._();

  static final instance = SystemCheckUsecaseImpl();

  Future<bool> checkIfPhysicalDevice();

  Future<bool> checkIfUnRooted();

  Future<bool> checkIfLocationGranted();

  Future<bool> checkIfLocationEnabled();

  Future<bool> checkIfWifiConnected();

  Future<bool> checkIfIIITVWifiConnected();

  Future<bool> checkCanPingServer();

  Future<bool> checkAppUpToDate();

  Future<bool> checkUserLoggedIn();

  Future<bool> checkRegistrationValid();
}
