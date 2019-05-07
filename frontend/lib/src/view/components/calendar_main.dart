import 'dart:html' as prefix0;

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/month.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/mock_appointments.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/calendar_service.dart';

@Component(
  selector: 'calendarMain',
  templateUrl: 'calendar_main.html',
  styleUrls: ['calendar_main.css'],
  directives: [coreDirectives, routerDirectives],
)
class CalendarComponent implements OnActivate, OnInit {
  CalendarComponent(this._calendarService, this._router, this._location);

  Month month = Month(DateTime.now().year, DateTime.now().month);
  bool call = true;
  final CalendarService _calendarService;
  final Router _router;
  final Location _location;

  // as variable but on call get appointments from service routine
  List<Appointment> get appointments => _calendarService.getAllAppointments();

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }

  @override
  void onActivate(RouterState previous, RouterState current) async {
    print(current.path.toString());
    final int yearInt = getYear(current.parameters);
    final int monthInt = getMonth(current.parameters);
    if (yearInt != null && monthInt != null) {
      month = _calendarService.getSpecificMonth(yearInt, monthInt);
    } else {
      month = _calendarService.initMonth();
    }
  }

  String monthURL(String year, String month) => RoutePaths.calendar
      .toUrl(parameters: {yearParam: year, monthParam: month});

  // ignore: unused_element
  void next() {
    call = false;
    //_calendarService.getMonth().next();
    _router.navigate(monthURL(
        month.nextM().first.toString(), month.nextM().last.toString()));
  }

  // ignore: unused_element
  void previus() {
    call = false;
    _router.navigate(monthURL(
        month.prevM().first.toString(), month.prevM().last.toString()));
  }

  void getDay(int Year, int month, int day) {
    // ignore: prefer_interpolation_to_compose_strings
    print("Year: " +
        Year.toString() +
        " Month: " +
        month.toString() +
        " Day: " +
        day.toString());
  }

  static const List<String> week = [
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"
  ];
}
