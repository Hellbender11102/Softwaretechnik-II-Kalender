import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';

class ContactService {
  // request to middlemand
  ContactService(this._http);

  // getter for the Authorization
  Map<String, String> get _headers => Map.fromEntries(
      [MapEntry("Authorization", "$_tokenType $_tokenAuth"), _type]);
  String get _tokenType => window.localStorage["token_type"];
  String get _tokenAuth => window.localStorage["access_token"];

  static const _type = MapEntry('Content-Type', 'application/json');
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
      return Contact.fromJson(_extractData(response as Response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///gibt eine Liste von allen Terminen zurück
  Future<List<Contact>> getAll() async {
    final Response response = (await _http.get('$_contactUrl')) as Response;
    return (_extractData(response) as List)
        .map((value) => Contact.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  ///Gibt den Termin mit der gegebenen id zurück
  Future<Contact> get(String contactCode) async {
    final Response response = (await _http.get('$_contactUrl/$contactCode')) as Response;
    return Contact.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Contact> create(Contact contact) async {
    try {
      final response = await _http.post(_contactUrl,
          headers: _headers, body: json.encode(contact));
      return Contact.fromJson(_extractData(response as Response) as Map<String, dynamic>);
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
    final Response response = (await _http.get('$_userUrl/$contactCode')) as Response;
    final User user =
        User.fromJson(_extractData(response) as Map<String, dynamic>);
    return Contact(user.id, user.username, user.surname, user.name, user.email,
        user.contactCode, "");
  }
}
