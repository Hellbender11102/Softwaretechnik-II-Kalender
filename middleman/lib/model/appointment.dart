import 'package:middleman/middleman.dart';

class Appointment extends ManagedObject<_Appointment> implements _Appointment{}

class _Appointment {
@primaryKey
int id;

@Column(unique: false)
String name;

@Column (unique: false)
String time;

@Column (unique: false)
String duration;

@Column (unique: false)
String location;
}



