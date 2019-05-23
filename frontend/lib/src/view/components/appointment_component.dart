import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'package:demo/src/view/components/login_component.dart';


@Component(
  selector: 'appointment',
  templateUrl: 'appointment_component.html',
  styleUrls: ['appointment_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
/// Klasse zur verwaltung der Termine
class AppointmentComponent implements OnActivate {

  AppointmentComponent(this._appointmentService, this._location, this._router);

  Appointment appointment;
  final Location _location;
  bool deleteControl = false;
  bool submitted = true;
  final Router _router;
  final AppointmentService _appointmentService;

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    } else {
      final id = getId(current.parameters);
      if (id != null) {
        appointment = await _appointmentService.get(id);
      }
    }
  }

  void onSubmit() => submitted = true;

  /// Methode zum speichern, der änderungen die man im Termin vorgenommen hat
  Future<void> save() async {
    await _appointmentService.update(appointment);
    goBack();
  }

  ///Methode zum löschen von Terminen
  Future<void> delete() async {
    if (deleteControl==true) {
      await _appointmentService.delete(appointment.id);
      goBack();
    } else {
      deleteControl = true;

    }
  }

  ///Methode, die die übergeordnete ansicht anzeigt
  void goBack() => _location.back();


}
