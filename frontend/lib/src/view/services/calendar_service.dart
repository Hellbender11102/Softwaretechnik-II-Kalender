import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/view/components/mock_appointments.dart';
import 'package:http/http.dart';

class CalendarService {
  // request to middlemand
  CalendarService(this._http);
  Month _month = Month(DateTime.now().year,DateTime.now().month);

  static final _headers = {'Content-Type': 'application/json'};
  static const _sampleUrl = 'http://localhost:8888/calendar'; // URL to web API
  final Client _http;

  // Implementation ORM below

  Month getMonth() {
    return _month;
  }

  void setMonth(int year,int month){
    _month = Month(year,month);
  }

  List<Appointment> getAllAppointments() {
    return mockAppointments;
  }
}
