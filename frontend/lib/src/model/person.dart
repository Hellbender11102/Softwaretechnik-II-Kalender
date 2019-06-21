abstract class Person {
  Person(this.id, this.contactCode, this.username, this.surname, this.name,
      this.email);
  Person.zero();

  int id;
  String username;
  String surname;
  String name;
  String email;
  String contactCode;

  bool equals(Person person) {
    return email == person.email &&
        username == person.username &&
        name == person.name &&
        surname == person.surname &&
        contactCode == person.contactCode &&
        id == person.id;
  }
}



/// Hier ist der User
class User extends Person {
  User(int id, String contactCode, String username, String surname, String name,
      String email, String password, String mobileNo)
      : password = password,
        mobileNo = mobileNo,
        super(id, contactCode, username, surname, name, email);

  User.zero() : super.zero();

  factory User.fromJson(Map<String, dynamic> user) => User(
      user['id'] as int,
      user['contactCode'] as String,
      user['username'] as String,
      user['surname'] as String,
      user['name'] as String,
      user['email'] as String,
      user['password'] as String,
      user['mobileNo'] as String);

  // ggf persistente Daten von einer Service Routine
  final List<Contact> _contactlist = List();


  String password;
  String mobileNo;


  Map<String, dynamic> toJson() => {
        'contactCode': contactCode,
        'username': username,
        'surname': surname,
        'name': name,
        'email': email,
        'password': password
      };

  // gets all of the ENDBENUTZER Contacts
  // ignore: missing_return
  Map<String, Contact> getMyContacts() {}
}


/// Hier ist der Kontakt
class Contact extends Person {
  Contact(int id, String username, String surname, String name, String email,
      String contactCode, String note)
      : super(id, contactCode, username, surname, name, email) {
    this.note = note;
  }

  factory Contact.fromJson(Map<String, dynamic> contact) => Contact(
      contact['id'] as int,
      contact['username'] as String,
      contact['surname'] as String,
      contact['name'] as String,
      contact['email'] as String,
      contact['contactCode'] as String,
      contact['note'] as String);

  String note;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'surname': surname,
        'name': name,
        'email': email,
        'contactCode': contactCode,
        'note': note
      };
}
