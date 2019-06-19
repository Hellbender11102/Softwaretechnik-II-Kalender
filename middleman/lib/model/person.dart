
import 'package:aqueduct/managed_auth.dart';
import 'package:middleman/middleman.dart';


class User extends ManagedObject<_User> implements _User,ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class Contact extends ManagedObject<_Contact> implements _Contact {}


class _Contact{
  @Column(unique: false,nullable: true)
  String note;

  @primaryKey
  int id;

  @Column(unique: true, nullable: true)
  String contactCode;

  @Column(unique: false)
  String surname;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String email;
}


class _User extends ResourceOwnerTableDefinition {

  @Column(unique: false, nullable: true)
  String mobileNo;

  @Column(unique: true, nullable: true)
  String contactCode;

  @Column(unique: false)
  String surname;

  @Column(unique: false)
  String name;

  @Column(unique: true)
  String email;
}

