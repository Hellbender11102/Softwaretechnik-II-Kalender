import 'package:http/http.dart';
class SampleService {
  // request to middlemand
  SampleService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/sample'; // URL to web API
  final Client _http;

  // Implementation ORM below
}