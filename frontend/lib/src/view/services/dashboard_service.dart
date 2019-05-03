import 'package:http/http.dart';
class DashboardService {
  // request to middlemand
  DashboardService(this._http);
  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/dashboard'; // URL to web API
  final Client _http;



  // Implementation ORM below
}