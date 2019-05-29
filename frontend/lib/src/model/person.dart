abstract class Person {
  Person(this.contactCode, this.nickname, this.surname, this.name, this.email);

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

  String password;

  User(String contactCode, String nickname, String surname, String name, String email, String password)
      :  password = password, super(contactCode,nickname, surname, name, email);

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

  factory User.fromJson(Map<String, String> user) =>
      User(user['contactCode'],
          user['nickname'],
          user['surname'],
          user['name'],
          user['email'],
          user['password']);

  Map toJson() => {'contactCode':contactCode,'nickname': nickname, 'surname': surname, 'name': name, 'email': email, 'password': password};

  // gets all of the ENDBENUTZER Contacts
  Map<String, Contact> getMyContacts() {}
}

int _toInt(id) => id is int ? id : int.parse(id as String);

class Contact extends Person {
  Contact(String nickname, String surname, String name, String email,String contactCode,this.note)
      : super(contactCode,nickname,surname,name,email);


  String note;

factory Contact.fromJson(Map<String, String> contact) =>
Contact(
    contact['contactCode'],
    contact['nickname'],
    contact['surname'],
    contact['name'],
    contact['email'],
    contact['note']);

Map toJson() => {'contactCode': contactCode,'nickname': nickname, 'surname': surname, 'name': name, 'email': email, 'note': note};
}

List<Contact> list = []
  ..add(Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "PQ459",
      "Pretty average Guy."))
  ..add(Contact("dude", "owski", "mike", "Mike.owski@gmail.com", "PQ458",
      "the underwhelming Guy."));
