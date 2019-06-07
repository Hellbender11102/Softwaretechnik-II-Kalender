import 'package:aqueduct/managed_auth.dart';
import 'package:middleman/middleman.dart';


class User extends ManagedObject<_User> implements _User,ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
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
