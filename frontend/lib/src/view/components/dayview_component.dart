import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/dayview_service.dart';
import 'package:demo/src/model/appointment.dart';

import 'mock_appointments.dart';
import 'login_component.dart';

@Component(
  selector: 'dayview',
  templateUrl: 'dayview_component.html',
  styleUrls: ['dayview_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DayviewComponent implements OnInit, OnActivate {

  // service Klasse für ORM
  DayviewComponent(this._dayviewService, this._router);

  final DayviewService _dayviewService;
  final Router _router;

  List<Appointment> appointments = mockAppointments;
  // List<Appointment> appointments = mockAppointments.sort((a, b) => a.date.compareTo(b.date));
  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }

  @override
  void onActivate(RouterState previous, RouterState current) {
    if (!LoginComponent.loggedIn) {
      _router.navigate('/login');
    }
  }
}