import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:demo/src/model/person.dart';
import '../components/mock_users.dart';

class UserService {
  // request to middlemand
  UserService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _registerUrl =
      'http://localhost:8080/register'; // URL to web API
  final Client _http;

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  ///Erstellt einen neuen User mit gegebenem Namen, Email und Passwort
  Future<User> create(
      int id, String nickname, String email, String password) async {
    try {
      final response = await _http.post(_registerUrl,
          headers: _headers,
          body: json.encode({
            'id': id,
            'nickname': nickname,
            'email': email,
            'password': password
          }));
      return User.fromJson(_extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///Updatet einen bereits existierenden User
  Future<User> update(User user) async {
    for (var mockUser in mockUsers) {
      if (mockUser.contactCode == user.contactCode) {
        mockUser = user;
      }
      return mockUser;
    }
  }
}
