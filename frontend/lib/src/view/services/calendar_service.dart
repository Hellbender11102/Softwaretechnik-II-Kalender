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

  Month getSpecificMonth(int yearInt,int monthInt,List<Appointment> appointments) {
    return month = Month(yearInt, monthInt,appointments);
  }
  Month getMonth() {
    return month;
  }

  //TODO USERCODE
  List<Appointment> getAllAppointments(String UserCode) {

    return mockAppointments;
  }
  //TODO USERCODE in datenbankabfrage checken und ergebnisse als liste von Appointments für diesen user
  List<Appointment> getAppointmentsForMonth(int year, int month,String userCode){
/*
Appointments von der DatenBank
 */
    List<Appointment> li;
    DateTime date;
    for(Appointment a in mockAppointments){
      date= a.dateTimeGen();
      if(date.year == year && date.month == month){
        li.add(a);
      }
    }
    return li;
  }

}
