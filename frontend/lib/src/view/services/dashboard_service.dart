import 'package:http/http.dart';
class DashboardService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/dashboard'; // URL to web API
  final Client _http;
  DashboardService(this._http);

  // request to middlemand
  // Implementation ORM below
}