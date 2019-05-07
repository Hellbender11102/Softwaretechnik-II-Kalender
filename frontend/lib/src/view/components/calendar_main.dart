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
class CalendarComponent implements OnInit {
  CalendarComponent(this._calendarService, this._router, this._location);

  bool call = true;
  final CalendarService _calendarService;
  final Router _router;
  final Location _location;

  // as variable but on call get month from service routine
  Month get month => _calendarService.getMonth();
  // as variable but on call get appointments from service routine
  List<Appointment> get appointments  => _calendarService.getAllAppointments();




  @override
  ngOnInit() {
    // still weirdo bug
    RegExp exp = RegExp( r"(\/)(calendar)(\/)(\d+)(\/)(\d+)");
    // gets the path
    final String path = _location.path();
    if(exp.firstMatch(path) != null && call){
      print("dudude");
      var arr = path.split("/");
      _calendarService.setMonth(int.tryParse(arr[2]), int.tryParse(arr[3]));
    };
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

  String monthURL(String year, String month) => RoutePaths.calendar
      .toUrl(parameters: {yearParam: year, monthParam: month});

  void next() {
    call =false;
    _calendarService.getMonth().next();
    _router.navigate(monthURL(month.year.toString(), month.month.toString()));
  }

  void previus() {
    call = false;
    _calendarService.getMonth().previus();
    _router.navigate(monthURL(month.year.toString(), month.month.toString()));

  }


  void getDay(int Year, int month,int day){

    print("Year: "+Year.toString() +" Month: "+month.toString()+" Day: "+day.toString());
  }
}
