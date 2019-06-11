

import 'package:test/test.dart';
import 'package:demo/src/model/day.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/person.dart';

void main() {
  Day day;
  Day day2;

  ///Tests for day.dart
  test("Day.isValid(), checks for a valid day", () {
    day = Day(2010, 11, 11);
    expect(day.isValid(), true);
  });
  test("Day.toString(), Gives The weekday + DD/MM//YYYY", () {
    day = Day(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    expect(
        day.toString(),
        day.weekday() +
            ":  " +
            DateTime.now().month.toString() +
            "/" +
            DateTime.now().day.toString() +
            "/" +
            DateTime.now().year.toString());
  });

  test("Day.weekday(), Gives The weekday As String", () {
    day = Day(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    day2 = Day(day.year, day.month, day.day + 7);
    if (day.day != day2.day) {
      expect(day.weekday(), day2.weekday());
    } else
      return false;
  });

  ///Tests for month.dart
  Month month;
  test("Month.prevM() und Month.nextM(), Gives the previous and next month",
      () {
    month = Month(2019, 6);
    expect(month.prevM()[1], 5);
    expect(month.nextM()[1], 7);
  });

  ///Tests for appointment.dart
  List<Appointment> appointments;
  Appointment appo =
      Appointment(1, "Abifaier", 2019, 6, 4, "2:30", "", "Lübeck", "hi");
  Appointment json = Appointment.zero();

  test("Appointment appointment.fromJson", () {
    expect(appo.equals(Appointment.fromJson(appo.toJson())), true);
  });

  ///Tests for person.dart

  User user = User(1,'CC123', 'Hellbender', 'Schindler', 'Laurenz',
      'Hallo@myWebmail.com', 'dasisteinschlechtesPasswort', '016331742');
  Contact contact = Contact(2,'Xanta', 'Waage', 'Daniel',
      'DanielHateinemail@mail.de', 'CC124', 'Ist ein feiner.');

  test("User.toJson == user.FromJson", () {
    expect(user.equals(User.fromJson(user.toJson())), true);
  });
  test("Contact.toJson == Contact.FromJson", () {
    expect(contact.equals(Contact.fromJson(contact.toJson())), true);
  });


}
