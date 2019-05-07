import 'package:demo/src/model/appointment.dart';

class Day {
  Day(this.order,this.year, this.month, this.day);
  int order;
  int year;
  int month;
  int day;

  List<Appointment> Appointments;

  @override
  String toString() {
    String pre = order.toString() + ":" + year.toString() + "," + month.toString() + "," + day.toString();
    switch (DateTime(year, month, day).weekday) {
      case 1:
        return pre + ", Monday \n";
      case 2:
        return pre + ", Tuesday \n";
      case 3:
        return pre + ", Wednesday \n";
      case 4:
        return pre + ", Thursday \n";
      case 5:
        return pre + ", Friday \n";
      case 6:
        return pre + ", Saturday \n";
      case 7:
        return pre + ", Sunday \n";
    }
  }
}
