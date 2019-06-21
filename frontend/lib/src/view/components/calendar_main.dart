import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/day.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/appointment_service.dart';

import 'login_component.dart';

@Component(
  selector: 'calendarMain',
  templateUrl: 'calendar_main.html',
  styleUrls: ['calendar_main.css'],
  directives: [coreDirectives, routerDirectives],
)
class CalendarComponent implements OnActivate, OnInit {
  CalendarComponent(this._appointmentService, this._router);

  Month month = Month(DateTime.now().year, DateTime.now().month);
  final AppointmentService _appointmentService;
  final Router _router;

  List<String> get week => month.week;
  List<Appointment> appointments = [];
  int today;
  int thisMonth;

  /// auswählen des Tages
  Future<NavigationResult> gotoDetail(Day day) =>
      _router.navigate(dayUrl(day.year, day.month, day.day));

  ///überprüft ob der Tag Termine hat
  int daysAppointments(Day day) {
    return appointments
        .where((app) =>
            app.year == day.year &&
            app.month == day.month &&
            app.day == day.day)
        .toList()
        .length;
  }

  Future<void> _getAppointments() async {
    today = DateTime.now().day;
    thisMonth = DateTime.now().month;
    appointments = await _appointmentService.getByDate(month.year, month.month);
    appointments.sort((a, b) => a.id.compareTo(b.id));
  }

  ///Nachfolgender Code wird bei der inizialisierung der Klasse ausgeführt
  @override
  void ngOnInit() => _getAppointments();

  @override
  void onActivate(RouterState previous, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    } else {
      final int yearInt = getYear(current.parameters);
      final int monthInt = getMonth(current.parameters);
      if (yearInt != null && monthInt != null) {
        month = Month(yearInt, monthInt);
        await _getAppointments();
      }
    }
  }

  ///erstellt immer die passende Url
  String monthURL(String year, String month) =>
      RoutePaths.calendar.toUrl(parameters: {yParam: year, mParam: month});

  String dayUrl(int yearInt, int monthInt, int dayInt) =>
      RoutePaths.dayview.toUrl(parameters: {
        yParam: "$yearInt",
        mParam: "$monthInt",
        dParam: "$dayInt"
      });

  ///navigiert zum näcshten Monat
  // ignore: unused_element
  void next() {
    _router.navigate(monthURL(
        month.nextM().first.toString(), month.nextM().last.toString()));
  }

  ///navigiert zum vorherigen Monat
  // ignore: unused_element
  void previous() {
    _router.navigate(monthURL(
        month.prevM().first.toString(), month.prevM().last.toString()));
  }
}
