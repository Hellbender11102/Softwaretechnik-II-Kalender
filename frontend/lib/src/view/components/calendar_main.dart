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

  Location _location;

  Month get month => _calendarService.getMonth();

  final Router _router;
  int _month;
  int _year;

  final CalendarService _calendarService;
  List<Appointment> appointments;

  @override
  ngOnInit() {

    // irgendwas hier bugged noch rum ggf kann das sein das die seite 2mal geladen wird durch die url
    //todo hübsch coden....
    String path = _location.path();
    print(path);
    var arr = path.split("/");
    print(arr.length);
    if (arr.length > 1) {
      print(arr[1]+" spacer "+arr[2]);
      _calendarService.setMonth(int.tryParse(arr[2]), int.tryParse(arr[3]));
    }

    getThemall();
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
    month.next();
    _router.navigate(monthURL(month.year.toString(), month.month.toString()));
  }

  void previus() {
    month.previus();
    _router.navigate(monthURL(month.year.toString(), month.month.toString()));
  }

  Future<List<Appointment>> getThemall() async {
    appointments = mockAppointments;
  }
  void getDay(int Year, int month,int day){

    print("Year: "+Year.toString() +" Month: "+month.toString()+" Day: "+day.toString());
  }
}
