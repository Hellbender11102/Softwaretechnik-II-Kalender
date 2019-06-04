import 'package:test/test.dart';
import 'package:demo/src/model/day.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/person.dart';


void main(){
Day day;
Day day2;


///Tests for day.dart
  test("Day.isValid(), checks for a valid day", () {
    day = Day(2010,11,11);
    expect(day.isValid(), true);
  });
  test("Day.toString(), Gives The weekday + DD/MM//YYYY", () {
    day = Day(DateTime.now().year,DateTime.now().month,DateTime.now().day);
    expect(day.toString(), day.weekday()+":  "+DateTime.now().month.toString()+"/"+DateTime.now().day.toString()+"/"+DateTime.now().year.toString());
  });
  test("Day.weekday(), Gives The weekday As String", () {
    day = Day(DateTime.now().year,DateTime.now().month,DateTime.now().day);
    day2 = Day(day.year,day.month,day.day+7);
    if(day.day != day2.day){
      expect(day.weekday(),day2.weekday());
    } else return false;
  });

///Tests for month.dart
  Month month;
  test("Month.prevM() und Month.nextM(), Gives the previous and next month", () {
    month = Month(2019, 6);
    expect(month.prevM()[1], 5);
    expect(month.nextM()[1], 7);
  });
  
///Tests for appointment.dart
  Appointment appo = Appointment(1, ["CC23"], "Abifaier", 2019, 6, 4, "2", "4", "Lübeck");
  Appointment json = Appointment.zero();
  json = Appointment.fromJson(appo.toJson());
   test("Appointment appointment.fromJson", () {
    expect(appo.equals(json), true);
  });

  test("Appointment", () {
    appo = Appointment(1, ["CC23"], "Abifaier", 2019, 6, 4, "2", "4", "Lübeck");
    expect(appo, appo.toJson());
  });



///Tests for person.dart
}