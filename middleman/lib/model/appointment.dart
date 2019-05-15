import 'package:middleman/middleman.dart';

class Appointment extends ManagedObject<_Appointment> implements _Appointment{}

class _Appointment {
@primaryKey
int id;

@Column(unique: true)
String name;
}



