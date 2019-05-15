import 'package:demo/src/model/appointment.dart';

class Day {
  Day(this.order, this.year, this.month, this.day);

  int order;
  int year;
  int month;
  int day;

  List<Appointment> appointments;

  @override
  String toString() {
    // ignore: prefer_interpolation_to_compose_strings
    return order.toString() +
        ":" +
        year.toString() +
        "," +
        month.toString() +
        "," +
        day.toString() +
        weekday();
  }

  String weekday() {
    switch (DateTime(year, month, day).weekday) {
      case 1:
        return "Monday \n";
      case 2:
        return "Tuesday \n";
      case 3:
        return "Wednesday \n";
      case 4:
        return "Thursday \n";
      case 5:
        return "Friday \n";
      case 6:
        return "Saturday \n";
      default:
        return "Sunday \n";
    }
  }
}
