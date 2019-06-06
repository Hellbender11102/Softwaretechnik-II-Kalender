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
          isUnique: false),
      SchemaColumn("note", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_Contact", [
      SchemaColumn("note", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("contactCode", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("nickname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("surname", ManagedPropertyType.string,
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
          isUnique: true)
    ]));
    database.createTable(SchemaTable("_User", [
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
          isNullable: true,
          isUnique: false),
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("contactCode", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("nickname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("surname", ManagedPropertyType.string,
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
          isUnique: true)
    ]));
    database.createTable(SchemaTable("_Person", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("contactCode", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("nickname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("surname", ManagedPropertyType.string,
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
          isUnique: true)
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
        "location": "Technischehochschule Lübeck",
        "note": ""
      },
      {
        "id": 2,
        "name": "zwei",
        "year": 2019,
        "month": 5,
        "day": 22,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck",
        "note": ""
      },
      {
        "id": 3,
        "name": "drei",
        "year": 2019,
        "month": 5,
        "day": 24,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck",
        "note": ""
      },
      {
        "id": 4,
        "name": "vier",
        "year": 2019,
        "month": 5,
        "day": 21,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck",
        "note": ""
      },
      {
        "id": 5,
        "name": "fünf",
        "year": 2019,
        "month": 7,
        "day": 22,
        "time": "12:00",
        "duration": "04:00",
        "location": "Technischehochschule Lübeck",
        "note": ""
      },
    ];

    final _contacts = [
      {
        "nickname": "marius",
        "surname": "Marius",
        "name": "Mauritz",
        "email": "hallo@hallo.gmx.de",
        "contactCode": "ContactCode1",
        "note": "Datenbank experte"
      },
      {
        "nickname": "lauri",
        "surname": "Laurenz",
        "name": "Schindler",
        "email": "hello@world.gmx.de",
        "contactCode": "ContactCode2",
        "note": "voll der pro"
      }
    ];

    final _users = [
      {
        "nickname": "dude2",
        "surname": "drei",
        "name": "vier",
        "email": "hello@hello.gmx.de",
        "contactCode": "12345",
        "password": "Calendar123",
        "mobileNo": ""
      }];

    _appointments.forEach((Map<String, dynamic> map) async =>
    await database.store.execute(
        "INSERT INTO _Appointment (name,time,year,month,day,duration,location,note) VALUES (@name,@time,@year,@month,@day,@duration,@location,@note)",
        substitutionValues: {
          "name": map['name'],
          "time": map['time'],
          "year": map['year'],
          "month": map['month'],
          "day": map['day'],
          "duration": map['duration'],
          "location": map['location'],
          "note": map['note']
        }));

    _contacts.forEach((Map<String, String> map) async =>
    await database.store.execute(
        "INSERT INTO _Contact (nickname,surname,name,email,contactCode,note) VALUES (@nickname,@surname,@name,@email,@contactCode,@note)",
        substitutionValues: {
          "nickname": map['nickname'],
          "surname": map['surname'],
          "name": map['name'],
          "email": map['email'],
          "contactCode": map['contactCode'],
          "note": map['note']
        }));

    _users.forEach((Map<String, String> map) async =>
    await database.store.execute(
        "INSERT INTO _User (nickname,surname,name,email,contactCode,password,mobileNo) VALUES (@nickname,@surname,@name,@email,@contactCode,@password,@mobileNo)",
        substitutionValues: {
          "nickname": map['nickname'],
          "surname": map['surname'],
          "name": map['name'],
          "email": map['email'],
          "contactCode": map['contactCode'],
          "password": map['password'],
          "mobileNo": map['mobileNo']
        }));

  }

}
