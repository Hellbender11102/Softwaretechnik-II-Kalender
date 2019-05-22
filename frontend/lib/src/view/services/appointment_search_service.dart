import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'package:demo/src/model/appointment.dart';
import '../components/mock_appointments.dart';

class AppointmentSearchService {
  AppointmentSearchService(this._http);

  final Client _http;



  Future<List<Appointment>> search(String term) async {

    final List<Appointment> appointments = List<Appointment>();

    for (var appointment in mockAppointments) {
      if (appointment.name.contains(term)) {
        appointments.add(appointment);
      }
    }
    return appointments;

    /**
    try {
      final response = await _http.get('app/appointments/?name=$term');
      return (_extractData(response) as List)
          .map((json) => Appointment.fromJson(json))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
        **/
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}