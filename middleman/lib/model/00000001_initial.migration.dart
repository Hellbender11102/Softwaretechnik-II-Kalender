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
          isNullable: true,
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
      SchemaColumn("year", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("month", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("day", ManagedPropertyType.integer,
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

    database.createTable(SchemaTable("_Contact", [
      SchemaColumn("nickname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("surename", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("email", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("contactCode", ManagedPropertyType.string,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("note", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));

    database.createTable(SchemaTable("_User", [
      SchemaColumn("contactCode", ManagedPropertyType.string,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("nickname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("surename", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("email", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("password", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("mobileNo", ManagedPropertyType.string,
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

    final _contacts = [
    {
      "nickname": "dude",
      "surename": "eins",
      "name": "zwei",
      "email": "hallo@hallo.gmx.de",
      "contactCode": "abcd",
      "note": "12:00",
    }];

    _appointments.forEach((Map<String, dynamic> map) async =>
        await database.store.execute(
            "INSERT INTO _Appointment (name,time,year,month,day,duration,location) VALUES (@name,@time,@year,@month,@day,@duration,@location)",
            substitutionValues: {
              "name": map['name'],
              "time": map['time'],
              "year": map['year'],
              "month": map['month'],
              "day": map['day'],
              "duration": map['duration'],
              "location": map['location'],
            }));

    _contacts.forEach((Map<String, String> map) async =>
    await database.store.execute(
        "INSERT INTO _Appointment (nickname,surename,name,email,contactCode,note) VALUES (@nickname,@surename,@name,@email,@contactCode,@note)",
        substitutionValues: {
          "nickname": map['nickname'],
          "surename": map['surename'],
          "name": map['name'],
          "email": map['email'],
          "contactCode": map['contactCode'],
          "note": map['note']
        }));
  }
}
