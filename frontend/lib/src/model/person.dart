import 'dart:mirrors';

abstract class Person {
  Person(this.nickname, this.surname, this.name, this.email);

  String nickname;
  String surname;
  String name;
  String email;
  String mobileNo;
  String contactCode;
}

class User extends Person {
  // ggf persistente Daten von einer Service Routine
  List<Contact> _contactlist = List();

  User(String nickname, String surname, String name, String email)
      : super(nickname, surname, name, email);

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

  // gets all of the ENDBENUTZER Contacts
  Map<String, Contact> getMyContacts() {}
}

class Contact extends Person {
  var contactCode;

  Contact(String nickname, String surname, String name, String email,
      this.contactCode)
      : super(nickname, surname, name, email);
}




class Mock {
  // gets a Contact from ALL Contacts by its ContactCode
  Contact getByContactCode(String contactCode) {
    // service routine lookup
    // CODE HERE
    // potentialy returns null
    return map[contactCode];
    // Mock
  }

  // Mock Datensatz

  static Contact marc =
      Contact("dude", "owski", "marc", "marc.owski@gmail.com", "contactCode1");
  static Contact mike =
      Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "contactCode2");

  // erstellt eine Map mit 2 Kontakten
  static Map<String, Contact> map = {
    "contactCode1": marc,
    "contactCode2": mike
  };
}
