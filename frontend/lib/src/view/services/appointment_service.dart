import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';
import 'package:demo/src/model/appointment.dart';
import '../components/mock_appointments.dart';

class AppointmentService {
  // request to middlemand
  AppointmentService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _appointmentUrl =
      'http://localhost:8888/appointments'; // URL to web API
  final Client _http;

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }

  ///Updatet einen bereits existierenden Termin
  Future<Appointment> update(Appointment appointment) async {
    try {
      final url = '$_appointmentUrl/${appointment.id}';
      final response = await _http.put(url,
          headers: _headers, body: json.encode(appointment)) as Response;
      return Appointment.fromJson(
          _extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///Löscht den Termin mit gegebener id
  Future<void> delete(int id) async {
    try {
      final url = '$_appointmentUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Appointment> get(int id) async {
    final Response response =
        await _http.get('$_appointmentUrl/$id') as Response;
    return Appointment.fromJson(_extractData(response) as Map<String, dynamic>);
  }

  Future<List<Appointment>> getByDate(int year, int month, [int day]) async {
    final Response response = (day != null)
        ? await _http.get('$_appointmentUrl/lookup/$year/$month/$day') as Response
        : await _http.get('$_appointmentUrl/lookup/$year/$month') as Response;
    return (_extractData(response) as List)
        .map((value) => Appointment.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  Future<List<Appointment>> getAll() async {
    final Response response = await _http.get('$_appointmentUrl') as Response;
    return (_extractData(response) as List)
        .map((value) => Appointment.fromJson(value as Map<String, dynamic>))
        .toList();
  }

  ///Gibt den Termin mit der gegebenen id zurück

  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Appointment> create(Appointment appointment) async {
    try {
      final response = await _http.post(_appointmentUrl,
          headers: _headers, body: json.encode(appointment.toJson()));
      return Appointment.fromJson(
          _extractData(response as Response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Appointment>> search(String term) async {
    try {
      final response = await _http.get('$_appointmentUrl');
      final List<Appointment> appointments = (_extractData(response as Response) as List)
          .map((json) => Appointment.fromJson(json as Map<String, dynamic>))
          .toList();
      appointments.retainWhere((h) => h.name.toLowerCase().contains(term.toLowerCase()));
      return appointments;
    } catch (e) {
      throw _handleError(e);
    }

  }
}
