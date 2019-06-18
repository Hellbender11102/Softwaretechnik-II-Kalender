import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/person_service.dart';

import 'package:demo/src/view/components/login_component.dart';


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

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    } else {
      final cc = getNumber(current.parameters);
      print(current.parameters);
      if (cc != null) {
        user = await _userService.get(cc);
      }
    }
  }

  /// Methode zum speichern der Änderungen, die man am User vorgenommen hat
  Future<void> save() async {
    await _userService.update(user);
  }

  ///Methode zum löschen von Terminen
  Future<void> delete() async {
    if (deleteControl==true) {
      await _userService.delete(user.username);
      goBack();
    } else {
      deleteControl = true;

    }
  }

  ///Methode, die die übergeordnete Ansicht anzeigt
  void goBack() => _location.back();
}