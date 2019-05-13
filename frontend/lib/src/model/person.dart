abstract class Person {
  Person(this.nickname, this.surname, this.name, this.email);

  String nickname;
  String surname;
  String name;
  String email;
  String mobileNo;
}

class User extends Person {
  // ggf persistente Daten von einer Service Routine
  List<Contact> _contactlist = List();

  String password;

  User(String nickname, String surname, String name, String email, String password) 
      : password = password, super(nickname, surname, name, email);

  // Adds a single contact, no duplicate by contactcode
  void addContact(Contact con) {
    if (_contactlist.any((ele) => ele.contactCode != con.contactCode)) {
      _contactlist.add(con);
    }
  }

  // adds all Contacts, no duplicates by contactcode
  void addContacts(List<Contact> list) => list.forEach(addContact);

  // removes contact from list
  void rmvContact(Contact con) => _contactlist.remove(con);

  // removes multiple Contacts
  void rmvAllContacts(List<Contact> list) => list.forEach(rmvContact);
}

class Contact extends Person {
  Contact(String nickname, String surname, String name, String email,
      this.contactCode, this.note)
      : super(nickname, surname, name, email);
  String contactCode;
  String note;
}

List<Contact> list = []
  ..add(Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "PQ459",
      "Pretty average Guy."))
  ..add(Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "PQ458",
      "the underwhelming Guy."));
