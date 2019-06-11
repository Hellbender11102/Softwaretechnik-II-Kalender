
import 'dart:async';
import 'dart:convert';
import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';

class ContactService {
  // request to middlemand
  ContactService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _userUrl = host + '/user'; // URL to web API
  static const _contactUrl = host + '/contacts'; // URL to web API
  final Client _http;

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }

  ///Updatet einen bereits existierenden Termin
  Future<Contact> update(Contact contact) async {
    try {
      final url = '$_contactUrl/${contact.contactCode}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(contact));
      return Contact.fromJson(_extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///gibt eine Liste von allen Terminen zurück
  Future<List<Contact>> getAll() async {
    final Response response = await _http.get('$_contactUrl');
    return (_extractData(response) as List)
        .map((value) => Contact.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  ///Gibt den Termin mit der gegebenen id zurück
  Future<Contact> get(String contactCode) async {
    final Response response = await _http.get('$_contactUrl/$contactCode');
    return Contact.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Contact> create(Contact contact) async {
    try {
      final response = await _http.post(_contactUrl,
          headers: _headers, body: json.encode(contact));
      return Contact.fromJson(_extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(String contactCode) async {
    try {
      final url = '$_contactUrl/$contactCode';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///Erstellt einen Kontakt und gibt ihn zurück
  Future<Contact> find(String contactCode) async {
    Contact contact;
    final Response response = await _http.get('$_userUrl/$contactCode');
    if (response.statusCode.toString() == "404") {
      return contact;
    }
    final User user = User.fromJson(_extractData(response) as Map<String, dynamic>);
    return Contact(user.id, user.nickname, user.surname, user.name, user.email, user.contactCode, "");
  }

  Future<List<Contact>> search(String term) async {
    try {
      final response = await _http.get('$_contactUrl');
      final List<Contact> contacts =
      (_extractData(response) as List)
          .map((json) => Contact.fromJson(json as Map<String, dynamic>))
          .toList();
      contacts.retainWhere(
              (h) => h.nickname.toLowerCase().contains(term.toLowerCase()));
      return contacts;
    } catch (e) {
      throw _handleError(e);
    }
  }
}
