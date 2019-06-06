import 'package:middleman/middleman.dart';

class Appointment extends ManagedObject<_Appointment> implements _Appointment {}

class _Appointment {
  @primaryKey
  int id;

  @Column(unique: false)
  String name;

  @Column(unique: false)
  String time;

  @Column(unique: false)
  int year;
  @Column(unique: false)
  int month;
  @Column(unique: false)
  int day;

  @Column(unique: false)
  String duration;

  @Column(unique: false)
  String location;

  @Column(unique: false)
  String note;

  @override
  String toString() {
    return "$id, $year-$month-$day";
  }
}
