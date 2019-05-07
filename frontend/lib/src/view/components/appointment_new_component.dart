import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'mock_appointments.dart';



@Component(
  selector: 'appointmentNew',
  templateUrl: 'appointment_new_component.html',
  styleUrls: ['appointment_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class AppointmentNewComponent implements OnActivate {

  // service Klasse für ORM
  AppointmentNewComponent(this._appointmentService, this._location);

  static int id = mockAppointments.last.id +1;
  Appointment appointment = Appointment(id, "", "", "", "", "");
  final Location _location;
  final AppointmentService _appointmentService;

  @override
  void onActivate(_, RouterState current) async {
    mockAppointments.add(appointment);
  }

  Future<void> create() async {
    await _appointmentService.update(appointment);
    goBack();
  }

  void goBack() => _location.back();


}
