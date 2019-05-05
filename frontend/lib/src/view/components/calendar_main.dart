import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/month.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/calendar_service.dart';

@Component(
  selector: 'calendarMain',
  templateUrl: 'calendar_main.html',
  styleUrls: ['calendar_main.css'],
  directives: [coreDirectives, routerDirectives],
)
class CalendarComponent implements OnInit {
  // service Klasse für ORM
  CalendarComponent(this._calendarService);

  final CalendarService _calendarService;

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
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
  static var month = DateTime.now().month;
  static var year = DateTime.now().year;
  Month monthClass = Month(year,month);
}
