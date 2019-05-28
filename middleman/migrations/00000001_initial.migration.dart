import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Appointment", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("time", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("year", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("month", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("day", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("duration", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("location", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
  }
  
  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final _appointments = [
      {
        "id": 1,
        "name": "eins",
        "year": 2019,
        "month": 7,
        "day": 22,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 2,
        "name": "zwei",
        "year": 2019,
        "month": 5,
        "day": 22,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 3,
        "name": "drei",
        "year": 2019,
        "month": 5,
        "day": 24,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 4,
        "name": "vier",
        "year": 2019,
        "month": 5,
        "day": 21,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 5,
        "name": "fünf",
        "year": 2019,
        "month": 7,
        "day": 22,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
    ];

    _appointments.forEach((Map<String, dynamic> map) async => await database
        .store
        .execute("INSERT INTO _Appointment (name,time,year,month,day,duration,location) VALUES (@name,@time,@year,@month,@day,@duration,@location)",
        substitutionValues: {
          "name": map['name'],
          "time": map['time'],
          "year": map['year'],
          "month": map['month'],
          "day": map['day'],
          "duration": map['duration'],
          "location": map['location'],
        }));


  }
}
    