import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/model/month.dart';
import 'package:angular_router/angular_router.dart';
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


  ngOnInit() {

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
  //kann mit monat +1 oder -1 auch andere monate anzeigen
  Month monthClass = Month(DateTime.now().year, DateTime.now().month);

  void next(){
   monthClass.next();
  }
  void previus(){
   monthClass.previus();
  }
  void getMonthYear(int year, int month){
    monthClass.year = year;
    monthClass.month= month;
  }


}
