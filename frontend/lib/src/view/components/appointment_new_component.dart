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
  //TODO datenbank
  //TODO Current user(signd in user)
  Appointment appointment = Appointment(1,["CCCURRENTUSER"], "", "", "", "", ""); //Später verändern
  final Location _location;
  final AppointmentService _appointmentService;
  final Router _router;


  ///Methode zum erstellen des neuen Termins
  Future<void> create() async { //Später in richtiges create umwandeln
    final int id = mockAppointments.last.id +1;
    appointment.id = id;
    mockAppointments.add(appointment);
    await _appointmentService.update(appointment); //.create()
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
