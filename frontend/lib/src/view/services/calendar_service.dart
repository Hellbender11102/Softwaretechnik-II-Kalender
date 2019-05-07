import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/view/components/mock_appointments.dart';
import 'package:http/http.dart';

class CalendarService {
  // request to middlemand
  CalendarService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _calendarUrl = 'http://localhost:8888/calendar'; // URL to web API
  final Client _http;

  Month month;
  // Implementation ORM below

  Month getSpecificMonth(int yearInt,int monthInt) {
    return month = Month(yearInt, monthInt);
  }
  Month getMonth() {
    return month;
  }

  /* potential waste
  void setMonth(int year,int month){
        Month(year,month);
  }
  */

  List<Appointment> getAllAppointments() {
    return mockAppointments;
  }

  Month initMonth() {
    return Month(DateTime.now().year,DateTime.now().month);
  }
}
