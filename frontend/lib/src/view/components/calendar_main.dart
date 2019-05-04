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
  static int currentMonthLength = DateTime.utc(year, month + 1, 0).day;
  static int prevMonthLength = DateTime.utc(year, month - 1, 0).day;
  static int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
  static int weekOffSet = prevMonthLength - firstWeekDayOfMonth;

  // creates iterable startin from Mo till Su
  static Iterable weekOfMonth(int n) sync* {
    int k = n*7 - firstWeekDayOfMonth +1;
    int count = 0;
    if (n == 0) {
      k = weekOffSet;
    }
    while (count < 7) {
      count++;
      k++;
      if (k >= prevMonthLength && n == 0) {
        k = 1;
      }
      if (k >= currentMonthLength && n!=0){
        k=1;
      }
      yield k;
    }
  }
}
