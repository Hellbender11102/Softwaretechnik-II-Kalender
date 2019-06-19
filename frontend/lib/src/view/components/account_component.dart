import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/person_service.dart';

import 'package:demo/src/view/components/login_component.dart';
import '../main_component.dart';


@Component(
  selector: 'account',
  templateUrl: 'account_component.html',
  styleUrls: ['account_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
/// Klasse zur verwaltung der Termine
class AccountComponent implements OnActivate {

  AccountComponent(this._userService, this._location, this._router);

  User user;
  final Location _location;
  bool deleteControl = false;
  final Router _router;
  final UserService _userService;
  bool editSurname = false;
  bool editName = false;
  bool editEmail = false;
  bool editMobileNo = false;
  bool editPassword = false;
  bool deleteAccount = false;
  String newPassword = "";
  String passwordWh = "";

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    } else {
      final id = 1; // User-ID muss noch hardcoded werden
      if (id != null) {
        user = await _userService.getById(id);
      }
    }
  }

  /// Methode zum speichern der Änderungen, die man am User vorgenommen hat
  Future<void> save() async {
    editSurname = false;
    editName = false;
    editEmail = false;
    editMobileNo = false;
    await _userService.update(user);
  }

  /// Methode zum Speichern des neuen Passworts
  Future<void> savePassword() async {
    editPassword = false;
    user.password = newPassword;
    await _userService.update(user);
  }

  ///Methode zum Löschen des Accounts
  Future<void> delete() async {
    if (deleteControl==true) {
      await _userService.deleteUser(user.username);
      LoginComponent.loggedIn = false;
      AppComponent.showButtons = false;
      await _router.navigate('/login');
    } else {
      deleteControl = true;
    }
  }

  ///Methode, die die übergeordnete Ansicht anzeigt
  void goBack() => _location.back();

  void surnameEdit() {
    editSurname = true;
  }

  void nameEdit() {
    editName = true;
  }

  void emailEdit() {
    editEmail = true;
  }

  void mobileNoEdit() {
    editMobileNo = true;
  }

  void passwordEdit() {
    editPassword = true;
  }

  void accountDelete() {
    deleteAccount = true;
  }
}