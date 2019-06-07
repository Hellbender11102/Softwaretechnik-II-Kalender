import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/components/mock_users.dart';
import 'package:demo/src/view/services/person_service.dart';
import 'package:demo/src/view/services/register_service.dart';

import '../../model/person.dart';
import '../main_component.dart';

@Component(
  selector: 'login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class LoginComponent implements OnInit, OnActivate {

  LoginComponent(this._router, this._userService,this._registerService);


  final UserService _userService;
  final RegisterService _registerService;

  final Router _router;
  bool loginFailure = false;
  static bool loggedIn = false;

  String username;
  String password;
  List<User> users;
  //User user;

  // 
  Future<void> login() async {
    loggedIn = true;
    AppComponent.showButtons = true;
    //await _registerService.login(username,password);
    await _router.navigate('/dashboard');



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
    if(loggedIn){
      _router.navigate('/calendar');
    }
  }
}