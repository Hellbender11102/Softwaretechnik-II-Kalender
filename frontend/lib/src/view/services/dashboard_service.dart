import 'dart:convert';

import 'package:http/http.dart';
class DashboardService {
  // request to middlemand
  DashboardService(this._http);
  static final _headers = {'Content-Type': 'application/json'};
  // thanks geeks jokes for the api
  // “ https://sv443.net/jokeapi
  // Greets
  static const _dashboardUrl = 'https://sv443.net/jokeapi/category/Programming'; // URL to web API
  final Client _http;
  ///Liest die Daten aus einer Response

  Future<List<String>> getJoke() async {
     Response response =  await _http.get('$_dashboardUrl');
     var map = json.decode(Utf8Codec().decode(response.bodyBytes));
     if(map['type']== "twopart"){
       return [map['setup'] as String,map['delivery']as String];
     }
     else{
       return [map['joke'] as String];
     }
  }
  // Implementation ORM below
}