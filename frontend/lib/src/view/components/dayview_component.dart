import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/dayview_service.dart';
import 'package:demo/src/model/appointment.dart';

import 'mock_appointments.dart';


@Component(
  selector: 'dayview',
  templateUrl: 'dayview_component.html',
  styleUrls: ['dayview_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DayviewComponent implements OnInit {

  // service Klasse für ORM
  DayviewComponent(this._dayviewService);

  final DayviewService _dayviewService;

  static List<Appointment> appointments = mockAppointments;

  @override
  void ngOnInit() async {
    appointments.sort((a, b) => a.time.compareTo(b.time));
    // do something when drawn
    // like DB connections
  }
}