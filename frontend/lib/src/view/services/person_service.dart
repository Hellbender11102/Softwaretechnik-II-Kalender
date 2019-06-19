import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';
import 'package:demo/src/model/person.dart';

class UserService {
  // request to middlemand
  UserService(this._http);

  //static final _headers = {'Content-Type': 'application/json'};
  static const _userUrl = host + '/user'; // URL to web API
  final Client _http;

  static const _type = MapEntry('Content-Type', 'application/json');

  // getter for the Authorization
  Map<String,String> get _headers => Map.fromEntries(
      [MapEntry("Authorization", "$_tokenType $_tokenAuth"), _type]);
  String get _tokenType => window.localStorage["token_type"];
  String get _tokenAuth => window.localStorage["access_token"];

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);
  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }

  ///Erstellt einen neuen User
  Future<User> create(User user) async {
    try {
      final response = await _http.post(_userUrl,
          headers: _headers, body: json.encode(user.toJson()));
      return User.fromJson(
          _extractData(response as Response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///Updatet einen bereits existierenden User
  Future<User> update(User user) async {
    // Add security Header
    final Response response = await _http.put(_userUrl,
        headers: _headers, body: json.encode(user.toJson())) as Response;
      return User.fromJson(
          _extractData(response as Response) as Map<String, dynamic>);
  }

  ///Löscht den User mit gegebenem contactCode
  Future<void> delete(String contactCode) async {
    // Add security Header
    final url = '$_userUrl/$contactCode';
    await _http.delete(url, headers: _headers);
  }

  ///Löscht den User mit gegebenem contactCode
  Future<void> deleteUser(String username) async {
    // Add security Header
    final url = '$_userUrl/look/$username';
    await _http.delete(url, headers: _headers);
  }

  Future<List<User>> getAll() async {
    final Response response = await _http.get('$_userUrl') as Response;
    return (_extractData(response) as List)
        .map((value) => User.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  Future<User> get(String contactCode) async {
    final Response response =
        await _http.get('$_userUrl/$contactCode') as Response;
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future<User> getById(int id) async {
    final Response response =
        await _http.get('$_userUrl/lookup/$id') as Response;
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future<User> getByUsername(String username) async {
    final Response response =
        await _http.get('$_userUrl/look/$username') as Response;
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }
}
