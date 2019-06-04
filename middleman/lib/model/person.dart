import 'package:middleman/middleman.dart';

class Person extends ManagedObject<_Person> implements _Person {}
class User extends ManagedObject<_User> implements _User {}
class Contact extends ManagedObject<_Contact> implements _Contact {}


abstract class _Person {

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



}

class _Contact extends _Person{

  @Column(unique: true)
  String note;

}

class _User extends _Person {

  @Column(unique: false)
  String password;

  @Column(unique: true)
  String mobileNo;

}

