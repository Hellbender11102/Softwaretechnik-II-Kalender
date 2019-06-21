import 'package:demo/src/model/day.dart';

class Month {
  // Constructor
  Month(this.year, this.month);

  int month;
  int year;

  ///giebt eine woche zurück
  ///int week welche woche des monats ausgewählt werden soll
  //weekOfMonth(1) wäre Montag der 27.06 bis Sonntag dem 02.07
  Iterable weekOfMonth(int week) sync* {
    final int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
    final int weekOffSet = -firstWeekDayOfMonth + 2;

    int k = weekOffSet + 7 * week;
    int count = 0;
    // 6 * 7 Tage
    while (count < 7) {
      // adds a day on top now again from top
      final DateTime time = DateTime.utc(year, month, k);
      count++;
      k++;
      yield Day(time.year, time.month, time.day);
    }
  }
  ///gibt den monat als String zurück
  @override
  String toString() {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      default:
        return "December";
    }
  }

  ///wählt den nächsten monat aus
  List<int> nextM() {
    int yearOut = year;
    int monthOut;
    if (month + 1 <= 12) {
      monthOut = month + 1;
    } else {
      monthOut = 1;
      yearOut = year + 1;
    }
    return [yearOut, monthOut];
  }

  ///wählt den vorhergegangenen monat aus
  List<int> prevM() {
    int yearOut = year;
    int monthOut;
    if (month - 1 > 0) {
      monthOut = month - 1;
    } else {
      month = 12;
      yearOut = year - 1;
    }
    return [yearOut, monthOut];
  }

  ///liste die die wochentage für die CalenderView hält
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
