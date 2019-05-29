import 'dart:js';

import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/day.dart';
import 'package:demo/src/view/services/calendar_service.dart';

class Month {
  // Constructor
  Month(this.year,this.month);

  int month;
  int year;
///returns a full week of
  Iterable weekOfMonth(int week) sync* {
    final int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
    final int weekOffSet = -firstWeekDayOfMonth+2;
    Day day;
    int k = weekOffSet + 7 * week;
    int count = 0;
    // 6 * 7 Tage
    while (count < 7) {
      // adds a day on top now again from top
      DateTime time = DateTime.utc(year, month , k);
      count++;
      k++;
      day =Day(count,time.year,time.month,time.day);
      for(Appointment a in appointments){
        if(a.dateTimeGen().day == day.day){
          day.appointments.add(a);
        }
      }
      yield day;
    }
  }

  @override
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

  List<int> nextM(){
    int yearOut = year;
    int monthOut;
    if(month + 1 <= 12) {
      monthOut = month + 1;
    }else {
      monthOut = 1;
      yearOut = year + 1;
    }
    return [yearOut,monthOut];

  }
  List<int> prevM(){
    int yearOut = year;
    int monthOut;
    if(month -1 > 0) {
      monthOut = month - 1;
    }else {
      month = 12;
      yearOut = year - 1;
    }
    return [yearOut,monthOut];
  }

  final List<String> week = [
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"
  ];
}
