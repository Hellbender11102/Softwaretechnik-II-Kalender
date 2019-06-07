import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/day.dart';

import 'login_component.dart';

@Component(
  selector: 'dayview',
  templateUrl: 'dayview_component.html',
  styleUrls: ['dayview_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DayviewComponent implements OnActivate {
  final Router _router;
  List appointments = List();
  Day day;

  // service Klasse für ORM
  DayviewComponent(this._appointmentService, this._router);

  final AppointmentService _appointmentService;

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    } else {
      this.day = Day(
          getYear(current.parameters),
          getMonth(current.parameters),
          getDay(current.parameters));
      if (day.isValid()) {
        appointments = await _appointmentService.getByDate(day.year,day.month,day.day);
        appointments.sort((a, b) => a.time.compareTo(b.time) as int);
      }
    }
  }

  ///Methode die die URL von dem Termin mit gegebener id als String zurückgibt
  String _appointmentUrl(int id) =>
      RoutePaths.appointment.toUrl(parameters: {idParam: '$id'});

  ///Methode die den ausgewählten Termin aufruft
  Future<NavigationResult> gotoDetail(Appointment appointment) =>
      _router.navigate(_appointmentUrl(appointment.id));
}
