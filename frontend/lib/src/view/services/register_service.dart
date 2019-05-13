import 'package:http/http.dart';

class RegisterService {
  RegisterService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _registerUrl = 'http://localhost:8080/#/register'; // URL to web API
  final Client _http;
}