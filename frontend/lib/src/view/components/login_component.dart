import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/person_service.dart';

import '../../model/person.dart';
import '../main_component.dart';

@Component(
  selector: 'login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class LoginComponent implements OnInit, OnActivate {

  LoginComponent(this._router, this._userService);


  final UserService _userService;

  final Router _router;
  bool loginFailure = false;
  static bool loggedIn = false;

  String nickname;
  String password;
  List<User> users;
  //User user;

  // 
  Future<void> login() async {
    users = await _userService.getAll();
    for (User u in users) {
      if ((nickname == u.nickname || nickname == u.email) && password ==u.password) {
        loggedIn = true;
        AppComponent.showButtons = true;
        await _router.navigate('/dashboard');
        break;
      } else {
        loginFailure = true;
      }
    }
    /*
    if (nickname.contains("@")) {
      user = await _userService.getLoginEmail(password, nickname);
    } else {
      user = await _userService.getLoginNickname(password, nickname);
    }*/
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