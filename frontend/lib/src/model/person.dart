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
  Contact(String nickname, String surname, String name, String email,String contactCode,String  note)
      : super(nickname,surname,name,email){
    this.contactCode = contactCode;
    this.note = note;
  }
  String contactCode ,note;

factory Contact.fromJson(Map<String, String> contact) =>
Contact(contact['nickname'],
    contact['surname'],
    contact['name'],
    contact['email'],
    contact['contactCode'],
    contact['note']);

Map toJson() => {'nickname': nickname, 'surname': surname, 'name': name, 'email': email, 'contactCode': contactCode, 'note': note};
}





  List<Contact> list = []..add(
      Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "PQ459",
          "Pretty average Guy."))..add(
      Contact("dude", "Osu", "Hike", "Mike.owski@gmail.com", "PQ858",
          "the underwhelming Guy."));