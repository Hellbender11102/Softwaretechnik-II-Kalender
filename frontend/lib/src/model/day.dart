import 'package:demo/src/model/appointment.dart';

class Day {
  Day(this.year, this.month, this.day);

  int year;
  int month;
  int day;

  List<Appointment> appointments;

  @override
  String toString() => "${weekday()}:  $month/$day/$year";

///überprüft ob der Tag richtig initalisiert ist
  bool isValid()=> year != null && month != null && day != null;

///returnd den Wochentag als String
  String weekday() {
    switch (DateTime(year, month, day).weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      default:
        return "Sunday";
    }
  }
}
