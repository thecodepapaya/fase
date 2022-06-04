import 'package:fase/data/constants.dart';

class Endpoints {
  // Auth endpoints
  static const login = '${Constants.BASE_URL}/login/';

  // Metadata endpoints
  static const metadata = '${Constants.BASE_URL}/metadata/';

  // Registration
  static const verifyRegistration = '${Constants.BASE_URL}/registration/verify/';
  static const register = '${Constants.BASE_URL}/registration/';
}
