import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';




@Component(
  selector: 'appointment',
  templateUrl: 'appointment_component.html',
  styleUrls: ['appointment_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
/// Klasse zur verwaltung der Termine
class AppointmentComponent implements OnActivate {

  AppointmentComponent(this._appointmentService, this._location);

  Appointment appointment = Appointment(1, "Test Termin", "", "", "", "");
  final Location _location;

  final AppointmentService _appointmentService;

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {


    final id = getId(current.parameters);
    if (id != null) {
      appointment = await (_appointmentService.get(id));
    }
  }

  /// Methode zum speichern, der änderungen die man im Termin vorgenommen hat
  Future<void> save() async {
    await _appointmentService.update(appointment);
    goBack();
  }

  ///Methode zum löschen von Terminen
  Future<void> delete() async {
    await _appointmentService.delete(appointment.id);
   goBack();
  }

  ///Methode, die die übergeordnete ansicht anzeigt
  void goBack() => _location.back();


}
