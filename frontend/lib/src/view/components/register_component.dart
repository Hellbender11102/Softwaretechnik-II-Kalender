import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/login_component.dart';
import 'package:demo/src/view/services/register_service.dart';

import '../../model/person.dart';
import 'mock_users.dart';

@Component(
  selector: 'register',
  templateUrl: 'register_component.html',
  styleUrls: ['register_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class RegisterComponent implements OnInit, OnActivate {

  RegisterComponent(this._registerService, this._router);

  final Router _router;
  final RegisterService _registerService;
  User user = User(1, "", "", "", "", "");


  Future<void> register() async {
    final int id = mockUsers.last.id +1;
    user.id = id;
    mockUsers.add(user);
    print(user.toString());
    await _registerService.update(user/*.id, user.nickname, user.email, user.password*/); //.create()
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
    if (!LoginComponent.loggedIn) {
      _router.navigate('/calendar');
    }
  }
}