import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'mock_appointments.dart';
import 'login_component.dart';


@Component(
  selector: 'appointmentNew',
  templateUrl: 'appointment_new_component.html',
  styleUrls: ['appointment_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

///Klasse zum erstellen eines neuen Termins
class AppointmentNewComponent implements OnActivate {

  AppointmentNewComponent(this._appointmentService, this._location, this._router);

  //Später löschen
  Appointment appointment = Appointment.zero();
  final Location _location;
  final AppointmentService _appointmentService;
  final Router _router;
  String dateString;


  ///Methode zum erstellen des neuen Termins
  Future<void> create() async {
    final List<Appointment> appointments = await _appointmentService.getAll();
    appointment.date = dateString;
    await _appointmentService.create(appointment);
    goBack();
  }

  ///Methode, die die übergeordnete ansicht anzeigt
  void goBack() => _location.back();

  @override
  void onActivate(RouterState previous, RouterState current) {
    if (!LoginComponent.loggedIn) {
      _router.navigate('/login');
    }
  }


}
