import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/login_component.dart';
import 'package:demo/src/view/services/person_service.dart';

import '../../model/person.dart';

@Component(
  selector: 'register',
  templateUrl: 'register_component.html',
  styleUrls: ['register_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class RegisterComponent implements OnInit, OnActivate {

  RegisterComponent(this._registerService, this._router);

  final Router _router;
  final UserService _registerService;
  User user = User.zero();


  Future<void> register() async {
    //mockUsers.add(user);
    await _registerService.create(user);
    await _router.navigate('/login');
  }

  Future<void> cancel() async {
    await _router.navigate('/login');
  }

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }

  @override
  void onActivate(RouterState previous, RouterState current) {
    if (LoginComponent.loggedIn) {
      _router.navigate('/calendar');
    }
  }
}