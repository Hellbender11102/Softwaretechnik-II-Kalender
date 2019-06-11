import 'dart:async';
import 'dart:convert';
import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';
import 'package:demo/src/model/person.dart';

class UserService {
  // request to middlemand
  UserService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _userUrl = host+'/user'; // URL to web API
  final Client _http;

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  ///Erstellt einen neuen User mit gegebenem Namen, Email und Passwort
  Future<User> create(User user) async {
    try {
      final response = await _http.post(_userUrl,
          headers: _headers, body: json.encode(user.toJson()));
      return User.fromJson(
          _extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<User>> getAll() async {
    final Response response = await _http.get('$_userUrl');
    return (_extractData(response) as List)
        .map((value) => User.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  Future<User> get(String contactCode) async {
    final Response response = await _http.get('$_userUrl/$contactCode');
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }

}
