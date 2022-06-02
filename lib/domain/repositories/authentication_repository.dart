import 'package:fase/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User?> login();
}
