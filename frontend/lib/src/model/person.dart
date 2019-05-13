abstract class Person{
  String nickname;
  String surname;
  String name;
  String email;


}

class User extends Person {
  List<Contact> contactlist;


}
class Contact extends Person{
  String contactCode;
  String note;

}