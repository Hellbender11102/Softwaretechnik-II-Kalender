import 'dart:html' as prefix0;

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/appointment.dart';
import 'package:demo/src/model/month.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/mock_appointments.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/calendar_service.dart';
import 'package:demo/src/model/day.dart';

@Component(
  selector: 'calendarMain',
  templateUrl: 'calendar_main.html',
  styleUrls: ['calendar_main.css'],
  directives: [coreDirectives, routerDirectives],
)
class CalendarComponent implements OnActivate, OnInit {
  CalendarComponent(this._calendarService, this._router, this._location);


 //Month month = Month(DateTime.now().year, DateTime.now().month);
  Month month = Month(DateTime.now().year, DateTime.now().month);
  final CalendarService _calendarService;
  final Router _router;
  final Location _location;
  List<String> get week => month.week;

  // as variable but on call get appointments from service routine
  List<Appointment> get appointments => _calendarService.getAllAppointments();

  // auswählen des Tages
  Future<NavigationResult> gotoDetail(Day day) =>
      _router.navigate(dayUrl(day.year,day.month,day.day));


  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }

  @override
  void onActivate(RouterState previous, RouterState current) async {
    final int yearInt = getYear(current.parameters);
    final int monthInt = getMonth(current.parameters);
    if (yearInt != null && monthInt != null) {
      month = _calendarService.getSpecificMonth(yearInt, monthInt);
    }
    //print(month.weekOfMonth(0).toString());
  }

  String monthURL(String year, String month) => RoutePaths.calendar
      .toUrl(parameters: {yParam: year, mParam: month});

  String dayUrl(int yearInt,int monthInt,int dayInt) =>
      RoutePaths.dayview.toUrl(parameters: {yParam: "$yearInt", mParam: "$monthInt", dParam: "$dayInt"});



  // ignore: unused_element
  void next() {
    _router.navigate(monthURL(
        month.nextM().first.toString(), month.nextM().last.toString()));
  }

  // ignore: unused_element
  void previous() {
    _router.navigate(monthURL(
        month.prevM().first.toString(), month.prevM().last.toString()));
  }

}
