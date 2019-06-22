import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/dashboard_service.dart';
import 'package:demo/src/view/components/login_component.dart';

@Component(
  selector: 'dash',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DashboardComponent implements OnInit, OnActivate {

  // service Klasse für ORM
  DashboardComponent(this._dashboardService, this._router);

  final DashboardService _dashboardService;
  final Router _router;
  List<String> joke;

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }

  @override
  void onActivate(RouterState previous, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    }
    else{
      joke = await _dashboardService.getJoke();
    }
  }
///lädt einen nueuen witz
  void refresh() async{
    joke = await _dashboardService.getJoke();
  }
}