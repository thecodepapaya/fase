import 'package:fase/data/constants.dart';

class Endpoints {
  // Auth
  static const login = '${Constants.BASE_URL}/login/';

  // Metadata
  static const getMetadata = '${Constants.BASE_URL}/metadata/';
  static const pingServer = '${Constants.BASE_URL}/ping/';

  // Registration
  static const verifyRegistration = '${Constants.BASE_URL}/registration/verify/';
  static const register = '${Constants.BASE_URL}/registration/';
}
