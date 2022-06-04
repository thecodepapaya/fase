import 'package:fase/domain/entities/user.dart';

import '../../data/repositories/authentication_repository.dart';

abstract class AuthenticationRepository {
  AuthenticationRepository._();

  static final instance = AuthenticationRepositoryImpl();

  Future<User?> login();
}
