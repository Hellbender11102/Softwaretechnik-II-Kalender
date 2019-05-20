import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/login_service.dart';

import '../../model/person.dart';
import 'mock_users.dart';

@Component(
  selector: 'login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class LoginComponent implements OnInit {

  LoginComponent(this._loginService, this._router);

  final Router _router;
  final LoginService _loginService;
  bool loginFailure = false;

  //Später löschen
  User user = User(1, "", "", "", "", ""); //Später verändern

  Future<void> login() async {
    for (int i = 0; i < mockUsers.length; i++) {
      if (user.nickname == mockUsers[i].nickname && user.password == mockUsers[i].password) {
        await _router.navigate('/dashboard');
        break;
      } else {
        loginFailure = true;
        //await _router.navigate('/register');
      }
    }
  }

  Future<void> register() async {
    _router.navigate('/register');
  }

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }
}