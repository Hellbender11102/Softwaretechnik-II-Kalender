import 'package:http/http.dart';

class LoginService {
  // request to middlemand
  LoginService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _registerUrl = 'http://localhost:8080/login'; // URL to web API
  final Client _http;
}