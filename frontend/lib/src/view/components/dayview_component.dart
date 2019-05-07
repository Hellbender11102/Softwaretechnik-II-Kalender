import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/dayview_service.dart';


@Component(
  selector: 'dayview',
  templateUrl: 'dayview_component.html',
  styleUrls: ['dayview_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DayviewComponent implements OnInit {

  // service Klasse für ORM
  DayviewComponent(this._dayviewService);

  final DayviewService _dayviewService;


  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }
}
class Appointment {
  int id = 10;
  String name ="zuviel";
  Appointment(this.id,this.name);
}