abstract class Person {
  Person(this.id, this.contactCode, this.nickname, this.surname, this.name,
      this.email);
  Person.zero();

  int id;
  String nickname;
  String surname;
  String name;
  String email;
  String contactCode;

  bool equals(Person person) {
    return this.email == person.email &&
        this.nickname == person.nickname &&
        this.name == person.name &&
        this.surname == person.surname &&
        this.contactCode == person.contactCode &&
        this.id == person.id;
  }
}

class User extends Person {
  User(int id, String contactCode, String nickname, String surname, String name,
      String email, String password, String mobileNo)
      : password = password,
        mobileNo = mobileNo,
        super(id, contactCode, nickname, surname, name, email);

  User.zero() : super.zero();

  factory User.fromJson(Map<String, dynamic> user) => User(
      user['id'] as int,
      user['contactCode'] as String,
      user['nickname'] as String,
      user['surname'] as String,
      user['name'] as String,
      user['email'] as String,
      user['password'] as String,
      user['mobileNo'] as String);

  // ggf persistente Daten von einer Service Routine
  final List<Contact> _contactlist = List();

  int id;
  String password;
  String mobileNo;

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

  Map<String, dynamic> toJson() => {
        'id': id,
        'contactCode': contactCode,
        'nickname': nickname,
        'surname': surname,
        'name': name,
        'email': email,
        'password': password
      };

  // gets all of the ENDBENUTZER Contacts
  Map<String, Contact> getMyContacts() {}
}

int _toInt(id) => id is int ? id : int.parse(id as String);

class Contact extends Person {
  Contact(int id, String nickname, String surname, String name, String email,
      String contactCode, String note)
      : super(id, contactCode, nickname, surname, name, email) {
    this.note = note;
  }

  factory Contact.fromJson(Map<String, dynamic> contact) => Contact(
      contact['id'] as int,
      contact['nickname'] as String,
      contact['surname'] as String,
      contact['name'] as String,
      contact['email'] as String,
      contact['contactCode'] as String,
      contact['note'] as String);

  String note;

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
        'surname': surname,
        'name': name,
        'email': email,
        'contactCode': contactCode,
        'note': note
      };
}
