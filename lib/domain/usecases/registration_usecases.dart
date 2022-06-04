import 'package:fase/data/usecase/registration_usecases.dart';
import 'package:fase/domain/entities/registration.dart';

abstract class RegistrationUsecase {
  RegistrationUsecase._();

  static final instance = RegistrationUsecaseImpl();

  Future<bool> verifyUserRegistration();

  Future<Registration?> registerUser();
}
