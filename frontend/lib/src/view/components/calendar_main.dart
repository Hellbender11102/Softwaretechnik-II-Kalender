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
  var month = DateTime.now().month;
  var year = DateTime.now().year;
  //kann mit monat +1 oder -1 auch andere monate anzeigen
  Month monthClass = Month(DateTime.now().year, DateTime.now().month);

  void next(){
    if(monthClass.next() >13){
      year = year+1;
      month = 1;
    }else{
      month +=1;
    }
  }
  void previus(){
    if(monthClass.previus()< 1){
      year -=1;
      month = 12;
    }else{
      month -=1;
    }
  }
  void getMonthYear(int year, int month){
    this.month = month;
    this.year = year;
    monthClass.year = year;
    monthClass.month= month;
  }
}
