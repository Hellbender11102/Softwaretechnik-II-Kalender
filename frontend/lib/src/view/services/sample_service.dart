import 'package:http/http.dart';
class SampleService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/sample'; // URL to web API
  final Client _http;
  SampleService(this._http);

  // request to middlemand
  // Implementation ORM below
}