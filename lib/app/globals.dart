import 'package:fase/app/utils/profile/profile.dart';

class Globals {
  Globals._();

  static const baseURL = 'https://192.168.1.8:8000/api/v1';
  static const iiitvDomain = 'iiitvadodara.ac.in';

  static final _profile = Profile.dummy();
  static Profile get profile => _profile;
  static set profile(Profile profile) => _profile;
}
