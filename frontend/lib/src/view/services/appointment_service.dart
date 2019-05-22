import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:demo/src/model/appointment.dart';
import '../components/mock_appointments.dart';

class AppointmentService {
  // request to middlemand
  AppointmentService(this._http);

  List<Appointment> appointmentlist = List();

  static final _headers = {'Content-Type': 'application/json'};
  static const _appointmentUrl =
      'http://localhost:8080/#/appointments'; // URL to web API
  final Client _http;

  ///Liest die Daten aus einer Response
  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }

  ///Updatet einen bereits existierenden Termin
  Future<Appointment> update(Appointment appointment) async {
    for (var mockAppointment in mockAppointments) {
      if (mockAppointment.id == appointment.id) {
        mockAppointment = appointment;
      }
      return mockAppointment;
    }
  }

  ///Löscht den Termin mit gegebener id
  Future<void> delete(int id) async {
    for (var appointment in mockAppointments) {
      print(appointment);
      if (appointment.id == id) {
        mockAppointments.removeWhere((element) => element.id == id);
      }
    }
  }

  ///gibt eine Liste von allen Terminen zurück
  Future<List<Appointment>> getAll() async {
    return mockAppointments;
  }

  ///gibt eine Liste von allen Terminen zurück
  List<Appointment> getByDate(String date) {
    List<Appointment> list;
    for (Appointment mockAppointment in mockAppointments) {
      if (mockAppointment.date == date) {
        list.add(mockAppointment);
      }
      return list;
    }
  }

  ///Gibt den Termin mit der gegebenen id zurück
  Future<Appointment> get(int id) async {
    for (var appointment in mockAppointments) {
      if (appointment.id == id) {
        return appointment;
      }
    }
  }

  ///Erstellt einen neuen Termin mit gegebenen Namen
  Future<Appointment> create(String name) async {
    try {
      final response = await _http.post(_appointmentUrl,
          headers: _headers, body: json.encode({'name': name}));
      return Appointment.fromJson(_extractData(response) as Map<int, String>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ///Löscht den Termin mit gegebener id
  Future<void> delete(int id) async {
    for (var appointment in mockAppointments) {
      if (appointment.id == id) {
        mockAppointments.removeWhere((element) => element.id == id);
      }
    }

    /*
    try {
      final url = '$_appointmentUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }*/
  }
}
