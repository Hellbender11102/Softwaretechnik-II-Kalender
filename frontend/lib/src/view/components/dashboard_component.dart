import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/dashboard_service.dart';


@Component(
  selector: 'dash',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DashboardComponent implements OnInit {

  // service Klasse für ORM
  DashboardComponent(this._dashboardService);

  final DashboardService _dashboardService;


  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }
}