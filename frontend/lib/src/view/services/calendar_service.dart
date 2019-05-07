import 'package:demo/src/model/appointment.dart';
import 'package:http/http.dart';
class CalendarService {
  // request to middlemand
  CalendarService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/calendar'; // URL to web API
  final Client _http;

  // Implementation ORM below

}