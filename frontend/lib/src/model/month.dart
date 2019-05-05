import 'package:demo/src/model/day.dart';

class Month {
  Month(int year,int month){
    this.month = month;
    this.year = year;
  }

  int month;
  int year;



  int monthLength(){
    return DateTime.utc(DateTime.now().year, month + 1).day;
  }
  Iterable weekOfMonth(int n) sync* {
    int currentMonthLength = DateTime.utc(year, month + 1, 0).day;
    int prevMonthLength = DateTime.utc(year, month , 0).day;
    int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
    int weekOffSet = prevMonthLength - firstWeekDayOfMonth;

    int k = n * 7 - firstWeekDayOfMonth + 1;
    int count = 0;
    if (n == 0) {
      k = weekOffSet;
    }
    while (count < 7) {
      count++;
      k++;
      if (k >= prevMonthLength && n == 0) {
        k = 1;
      }
      if (k >= currentMonthLength && n != 0) {
        k = 1;
      }
      yield k;
    }
  }

  String toString(){
    switch(month){
      case 1: return "January";
      case 2: return "February";
      case 3: return "March";
      case 4: return "April";
      case 5: return "May";
      case 6: return "June";
      case 7: return "July";
      case 8: return "August";
      case 9: return "September";
      case 10: return "October";
      case 11: return "November";
      case 12: return "December";
      default: return month.toString();
    }
  }
}
