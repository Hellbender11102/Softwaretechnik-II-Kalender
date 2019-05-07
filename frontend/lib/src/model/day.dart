
import 'package:demo/src/model/appointment.dart';

class Day{

  Day(int day){
    dayOfMonth = day;
  }

  List<Appointment> Appointments;
  static int dayOfMonth;
  String day = toString();

  //todo just current month
  @override
  static String toString(){
   switch (DateTime(DateTime.now().month,dayOfMonth).weekday){
     case 1: return "Monday";
     case 3: return "Wednesday";
     case 4: return "Thursday";
     case 5: return "Friday";
     case 6: return "Saturday";
     case 7: return "Sunday";
     default: return DateTime(DateTime.now().month,dayOfMonth).weekday.toString();
       }
  }

  int toInt(){
   return dayOfMonth;
  }
}