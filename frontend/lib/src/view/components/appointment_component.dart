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

class AppointmentComponent implements OnActivate {

  // service Klasse für ORM
  AppointmentComponent(this._appointmentService/*, this._location*/);

  Appointment appointment;
  //final Location _location;

  final AppointmentService _appointmentService;

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) appointment = await (_appointmentService.get(id));
  }

  Future<void> save() async {
    await _appointmentService.update(appointment);
    //goBack();
  }

  Future<void> delete() async {
    await _appointmentService.delete(appointment.id);
   // goBack();
  }

  //void goBack() => _location.back();


}
