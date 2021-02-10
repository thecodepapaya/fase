import 'package:http/http.dart' as http;

class API {
  static const String BASE_URL = '40.80.94.133';
  // static const String BASE_URL = 'http://127.0.0.1:8000/';

  Future<http.Response> getCourses() async {
    return await http.get(BASE_URL + 'course/?format=json');
  }
}
