

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:demo/src/view/main_component.dart';
import 'package:http/http.dart';
import 'package:demo/src/model/appointment.dart';

class AppointmentService {
  // request to middlemand
  AppointmentService(this._http);

  static const _appointmentUrl = host + '/appointments'; // URL to web API
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

  ///Updatet einen bereits existierenden Termin
  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Appointment> update(Appointment appointment) async {
    // Add security Header
    final Response response = await _http.put(_appointmentUrl,
        headers: _headers, body: json.encode(appointment.toJson())) as Response;
      return Appointment.fromJson(
          _extractData(response as Response) as Map<String, dynamic>);
  }

  ///Löscht den Termin mit gegebener id
  Future<void> delete(int id) async {
    // Add security Header
    final url = '$_appointmentUrl/$id';
    await _http.delete(url, headers: _headers);
  }

  Future<Appointment> get(int id) async {
    final Response response =
        await _http.get('$_appointmentUrl/$id',headers: _headers) as Response;
    return Appointment.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future<List<Appointment>> getByDate(int year, int month, [int day]) async {
    final Response response = (day != null)
        ? await _http.get('$_appointmentUrl/lookup/$year/$month/$day',headers: _headers)
            as Response
        : await _http.get('$_appointmentUrl/lookup/$year/$month',headers: _headers) as Response;
    return (_extractData(response) as List)
        .map((value) => Appointment.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  Future<List<Appointment>> getAll() async {
    final Response response =
        await _http.get("$_appointmentUrl", headers: _headers) as Response;
    print(response.statusCode.toString());
      return (_extractData(response) as List)
          .map((value) => Appointment.fromJson(value as Map<String, dynamic>))
          .toList();
  }

  ///Gibt den Termin mit der gegebenen id zurück

  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Appointment> create(Appointment appointment) async {
    final response = await _http.post(_appointmentUrl,
        headers: _headers, body: json.encode(appointment.toJson()));
    return Appointment.fromJson(
        _extractData(response as Response) as Map<String, dynamic>);
  }

  Future<List<Appointment>> search(String term) async {
    try {
      final response = await _http.get('$_appointmentUrl',headers: _headers);
      final List<Appointment> appointments =
          (_extractData(response as Response) as List)
              .map((json) => Appointment.fromJson(json as Map<String, dynamic>))
              .toList();
      appointments.retainWhere(
          (h) => h.name.toLowerCase().contains(term.toLowerCase()));
      return appointments;
    } catch (e) {
      throw _handleError(e);
    }
  }
}
