import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'appointment_component.dart';
import 'mock_appointments.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

@Component(
  selector: 'appointments',
  templateUrl: 'appointment_list_component.html',
  styleUrls: ['appointment_list_component.css'],
  directives: [coreDirectives, routerDirectives, AppointmentComponent],
  pipes: [commonPipes],
)
class AppointmentListComponent implements OnInit {
  AppointmentListComponent(this._appointmentService, this._router);

  final AppointmentService _appointmentService;
  final Router _router;
  List<Appointment> appointments;
  Appointment selected;
  void onSelect(Appointment appointment) => selected = appointment;

  Future<void> _getAppointments() async {
   // appointments = await _appointmentService.getAll();
    appointments = mockAppointments;
  }

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    appointments.add(await _appointmentService.create(name));
    selected = null;
  }

  void ngOnInit() => _getAppointments();



  String _appointmentUrl(int id) =>
      RoutePaths.appointment.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_appointmentUrl(selected.id));
}