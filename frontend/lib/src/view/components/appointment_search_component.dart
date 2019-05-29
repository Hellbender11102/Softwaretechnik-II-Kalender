import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';


@Component(
  selector: 'appointment-search',
  templateUrl: 'appointment_search_component.html',
  styleUrls: ['appointment_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(AppointmentService)],
  pipes: [commonPipes],
)
class AppointmentSearchComponent implements OnInit {

  AppointmentSearchComponent(this._appointmentService, this._router) {}

  AppointmentService _appointmentService;
  Router _router;

  Stream<List<Appointment>> appointments;
  final StreamController<String> _searchTerms = StreamController<String>.broadcast();



  void search(String term) => _searchTerms.add(term);

  @override
  void ngOnInit() async {
    appointments = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
        ? Stream<List<Appointment>>.fromIterable([<Appointment>[]])
        : _appointmentService.search(term).asStream()))
        .handleError(print);
  }

  String _appointmentUrl(int id) =>
      RoutePaths.appointment.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail(Appointment appointment) =>
      _router.navigate(_appointmentUrl(appointment.id));
}
