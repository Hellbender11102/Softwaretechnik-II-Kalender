import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';
import 'package:demo/src/model/appointment.dart';
import '../components/mock_appointments.dart';

class AppointmentService {
  // request to middlemand
  AppointmentService(this._http);

  //List<Appointment> appointmentlist = List();

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
      final response =
      await _http.put(url, headers: _headers, body: json.encode(appointment)) as Response;
      return Appointment.fromJson(_extractData(response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }

    /**
    for (var mockAppointment in mockAppointments) {
      if (mockAppointment.id == appointment.id) {
        mockAppointment = appointment;
      }
      return mockAppointment;
    }**/
  }

  ///Löscht den Termin mit gegebener id
  Future<void> delete(int id) async {

    try {
      final url = '$_appointmentUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }

    /**
    for (var appointment in mockAppointments) {
      print(appointment);
      if (appointment.id == id) {
        mockAppointments.removeWhere((element) => element.id == id);
      }
    }**/
  }


  Future<Appointment> get(int id) async {
    final Response response =
        await _http.get('$_appointmentUrl/$id') as Response;
    return Appointment.fromJson(_extractData(response) as Map<String, dynamic>);
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
          headers: _headers, body: json.encode(appointment));
      return Appointment.fromJson(
          _extractData(response as Response) as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }


}
