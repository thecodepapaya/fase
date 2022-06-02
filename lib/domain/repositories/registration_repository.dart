import 'package:fase/domain/entities/registration.dart';

abstract class RegistrationRepository {
  Future<bool> verifyRegistration();

  Future<Registration> register();

  Future<Registration> registrationStatus();
}
