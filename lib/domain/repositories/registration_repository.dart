import 'package:fase/domain/entities/registration.dart';

import '../../data/repositories/registration_repository.dart';

abstract class RegistrationRepository {
  RegistrationRepository._();

  static final instance = RegistrationRepositoryImpl();

  Future<Registration?> verifyRegistration(String deviceID);

  Future<Registration?> register(Registration registration);
}
