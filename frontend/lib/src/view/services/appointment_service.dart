import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:demo/src/model/appointment.dart';
import '../components/mock_appointments.dart';
class AppointmentService {
  // request to middlemand
  AppointmentService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  static const _appointmentUrl = 'http://localhost:8080/calendar/appointment'; // URL to web API
  final Client _http;

// Implementation ORM below
// ···

  dynamic _extractData(Response resp) => json.decode(resp.body);
  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  Future<Appointment> update(Appointment appointment) async {
    for (var mockAppointment in mockAppointments) {
      if (mockAppointment.id == appointment.id) mockAppointment = appointment;
        return appointment;
    }
    /*
    try {
      final url = '$_appointmentUrl/${appointment.id}';
      final response =
      await _http.put(url, headers: _headers, body: json.encode(appointment));
      return Appointment.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }*/
  }

  Future<Appointment> get(int id) async {
    for (var appointment in mockAppointments) {
      if (appointment.id == id) return appointment;
    }
    /*
    try {
      final response = await _http.get('$_appointmentUrl/$id');
      return Appointment.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }*/
  }

  Future<Appointment> create(String name) async {
    try {
      final response = await _http.post(_appointmentUrl,
          headers: _headers, body: json.encode({'name': name}));
      return Appointment.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_appointmentUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }
}
