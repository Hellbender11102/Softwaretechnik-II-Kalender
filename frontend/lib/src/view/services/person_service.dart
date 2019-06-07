import 'dart:async';
import 'dart:convert';
import 'dart:html';
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
          _extractData(response as Response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<User>> getAll() async {
    final Response response = await _http.get('$_userUrl') as Response;
    return (_extractData(response) as List)
        .map((value) => User.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  Future<User> get(String contactCode) async {
    final Response response = await _http.get('$_userUrl/$contactCode') as Response;
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future login(String username, String password) async {
    // Must include http package in your pubspec.yaml
    const clientID = "com.calendar.app";
    final body = "username=$username&password=$password&grant_type=password";
// Note the trailing colon (:) after the clientID.
// A client identifier secret would follow this, but there is no secret, so it is the empty string.
    final clientCredentials = Base64Encoder().convert("$clientID:".codeUnits);

    final response = await _http.post(
        "https://stablekernel.com/auth/token",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Basic $clientCredentials"
        },
        body: body);
        window.localStorage.addAll({"access_token": response["access_token"]as String,"token_type":response["token_type"]as String,"expires_in": response["expires_in"] as String});
  }



  /*Future<User> getLoginEmail(String password, String email) async {
    final Response response = await _http.get('$_userUrl/$password/$email');
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future<User> getLoginNickname(String password, String username) async {
    final Response response = await _http.get('$_userUrl/$password/$nickname');
    return User.fromJson(_extractData(response) as Map<String, dynamic>);
  }*/

  /*///Updatet einen bereits existierenden User
  Future<User> update(User user) async {
    for (var mockUser in mockUsers) {
      if (mockUser.contactCode == user.contactCode) {
        mockUser = user;
      }
      return mockUser;
    }
  }*/
}
