import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/week.dart';
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
  static const List<String> week =[
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"];
}
