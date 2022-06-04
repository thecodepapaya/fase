import 'package:fase/domain/entities/registration.dart';

import '../../data/repositories/registration_repository.dart';

abstract class RegistrationRepository {
  RegistrationRepository._();

  static final instance = RegistrationRepositoryImpl();

  Future<bool> verifyRegistration();

  Future<Registration> register();

  Future<Registration> registrationStatus();
}
