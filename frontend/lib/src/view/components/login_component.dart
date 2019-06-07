import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/mock_users.dart';
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

  String username;
  String password;
  List<User> users;
  //User user;

  // 
  Future<void> login() async {
    await _userService.login(username,password);
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