import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/login_service.dart';

import '../../model/person.dart';
import 'mock_users.dart';
import '../main_component.dart';

@Component(
  selector: 'login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class LoginComponent implements OnInit, OnActivate {

  LoginComponent(this._loginService, this._router);

  final Router _router;
  final LoginService _loginService;
  bool loginFailure = false;
  static bool loggedIn = false;

  String nickname;
  String password;

  // 
  Future<void> login() async {
    for (User u in mockUsers) {
      if ((nickname == u.nickname || nickname == u.email) && password ==u.password) {
        loggedIn = true;
        AppComponent.showButtons = true;
        await _router.navigate('/dashboard');
        break;
      } else {
        loginFailure = true;
      }
    }
  }

  // Weiterleitung zum Registrierungsformular
  Future<void> register() async {
    await _router.navigate('/register');
  }

  Future<void> logout() async {
    loggedIn = false;
    AppComponent.showButtons = false;
    await _router.navigate('/login');
  }

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections //TODO
  }

  void setLoginFalse() {
    loggedIn = false;
  }

  @override
  void onActivate(RouterState previous, RouterState current) {
    if (loggedIn) {
      _router.navigate('/calendar');
    }
  }
}