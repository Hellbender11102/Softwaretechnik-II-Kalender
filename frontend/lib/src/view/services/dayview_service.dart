import 'package:http/http.dart';
class DayviewService {
  // request to middlemand
  DayviewService(this._http);
  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/dayview'; // URL to web API
  final Client _http;



  // Implementation ORM below
}