import 'package:middleman/middleman.dart';

class Person extends ManagedObject<_Person> implements _Person {}
class Contact extends ManagedObject<_Contact> implements _Contact {}
class User extends ManagedObject<_User> implements _User {}


class _Person {

  @primaryKey
  String contactCode;

  @Column(unique: false)
  String nickname;

  @Column(unique: false)
  String surname;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String email;

  @Column(unique: true)
  String mobileNo;

}

class _User {

  @primaryKey
  String contactCode;

  @Column(unique: false)
  String nickname;

  @Column(unique: false)
  String surname;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String email;

  @Column(unique: false)
  String password;

}

class _Contact {

  @primaryKey
  String contactCode;

  @Column(unique: false)
  String nickname;

  @Column(unique: false)
  String surname;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String email;

  @Column(unique: true)
  String note;

}