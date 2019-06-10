import 'dart:async';
import 'dart:convert';
import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';
import 'package:demo/src/model/person.dart';
import 'dart:html';

class RegisterService {
  // request to middlemand
  RegisterService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _userUrl = host+'/register'; // URL to web API
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

  Future login(String username, String password) async {
    // Must include http package in your pubspec.yaml
    const clientID = "com.calendar.app";
    final body = "username=$username&password=$password&grant_type=password";
// Note the trailing colon (:) after the clientID.
// A client identifier secret would follow this, but there is no secret, so it is the empty string.
    final clientCredentials = Base64Encoder().convert("$clientID:".codeUnits);

    final response = await _http.post("$host/auth/token",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Basic $clientCredentials"
        },
        body: body);
    final Map<String,dynamic> jsonMap = json.decode(response.body as String) as Map<String, dynamic>;
    capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    window.localStorage.addAll({
      "access_token": jsonMap["access_token"] as String,
      "token_type": capitalize(jsonMap["token_type"] as String),
      "expires_in": (jsonMap["expires_in"] as int).toString()
    });
  }
}
