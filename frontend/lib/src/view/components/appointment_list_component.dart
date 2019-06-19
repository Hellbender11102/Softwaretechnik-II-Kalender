import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'appointment_component.dart';
import 'appointment_search_component.dart';
import 'login_component.dart';



@Component(
  selector: 'appointments',
  templateUrl: 'appointment_list_component.html',
  styleUrls: ['appointment_list_component.css'],
  directives: [coreDirectives, routerDirectives, AppointmentComponent, AppointmentSearchComponent],
  pipes: [commonPipes],
)

///Klasse zum anzeigen aller Termine
class AppointmentListComponent implements OnInit, OnActivate {
  AppointmentListComponent(this._appointmentService, this._router);

  final AppointmentService _appointmentService;
  final Router _router;
  List<Appointment> appointments;


  ///Methode die eine Liste aller appointments zurückgibt
  Future<void> _getAppointments() async {
    appointments = await _appointmentService.getAll();
    appointments.sort((a, b) => a.date.compareTo(b.date));
  }

  ///Nachfolgender Code wird bei der inizialisierung der Klasse ausgeführt
  @override
  void ngOnInit() => _getAppointments();
  @override
  void onActivate(RouterState previous, RouterState current) {
    if (!LoginComponent.loggedIn) {
      _router.navigate('/login');
    }
  }

    ///Methode die die URL von dem Termin mit gegebener id als String zurückgibt
    String _appointmentUrl(int id) =>
        RoutePaths.appointment.toUrl(parameters: {idParam: '$id'});

    ///Methode die den ausgewählten Termin aufruft
    Future<NavigationResult> gotoDetail(Appointment appointment) =>
        _router.navigate(_appointmentUrl(appointment.id));
}
