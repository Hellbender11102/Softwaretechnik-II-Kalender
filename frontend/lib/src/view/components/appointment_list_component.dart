import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'appointment_component.dart';

@Component(
  selector: 'appointments',
  templateUrl: 'appointment_list_component.html',
  styleUrls: ['appointment_list_component.css'],
  directives: [coreDirectives, routerDirectives],
  pipes: [commonPipes],
)

///Klasse zum anzeigen aller Termine
class AppointmentListComponent implements OnInit {
  AppointmentListComponent(this._appointmentService, this._router);

  final AppointmentService _appointmentService;
  final Router _router;
  List<Appointment> appointments;
  Appointment selected;

  ///Methode zum auswählen eines Termins
  void onSelect(Appointment appointment) => selected = appointment;

  ///Methode die eine Liste aller appointments zurückgibt
  Future<void> _getAppointments() async {
    appointments = await _appointmentService.getAll();
    //appointments = mockAppointments;
  }

  /*Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    appointments.add(await _appointmentService.create(name));
    selected = null;
  }*/

  ///Nachfolgender Code wird bei der inizialisierung der Klasse ausgeführt
  @override
  void ngOnInit() => _getAppointments();



  ///Methode die die URL von dem Termin mit gegebener id als String zurückgibt
  String _appointmentUrl(int id) =>
      RoutePaths.appointment.toUrl(parameters: {idParam: '$id'});

  ///Methode die den ausgewählten Termin aufruft
  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_appointmentUrl(selected.id));
}