import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Appointment", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("time", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("date", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("duration", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("location", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final _appointments = [
      {
        "id": 1,
        "name": "eins",
        "date": "2019-05-07",
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 2,
        "name": "zwei",
        "date": "2019-05-07",
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 3,
        "name": "drei",
        "date": "2019-05-07",
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 4,
        "name": "vier",
        "date": "2019-05-07",
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
      {
        "id": 5,
        "name": "fünf",
        "date": "2019-05-07",
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck"
      },
    ];

    _appointments.forEach((Map<String, dynamic> map) async => await database
            .store
            .execute("INSERT INTO _Appointment (name,time,date,duration,location) VALUES (@name,@time,@date,@duration,@location)",
                substitutionValues: {
              "name": map['name'],
              "time": map['time'],
              "date": map['date'],
              "duration": map['duration'],
              "location": map['location'],
            }));


  }
}
