import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/routes/routes.dart';
import 'package:demo/src/view/services/appointment_service.dart';
import 'package:demo/src/view/services/contact_service.dart';
import 'package:demo/src/view/services/dashboard_service.dart';
import 'package:demo/src/view/services/person_service.dart';
import 'package:demo/src/view/services/register_service.dart';

import 'components/login_component.dart';

@Component(
  selector: 'my-cal',
  styleUrls:['desktop.css','theme-672-1024.css','mobile.css'],
  templateUrl: 'main_component.html',
  directives: [routerDirectives],
  providers: [
    ClassProvider(AppointmentService),
    ClassProvider(UserService),
    ClassProvider(ContactService),
    ClassProvider(DashboardService),
    ClassProvider(RegisterService),
    ],
  exports: [RoutePaths, Routes],
)
class AppComponent {

  final String title = 'innerComponent';


  //todo muss raus hier
  static bool showButtons = false;
  void logout() {

    if (window.confirm('Are you sure you want to log out?')) {
      LoginComponent.loggedIn = false;
      showButtons = false;
    } else {
      // Do nothing!
    }

  }
}
// Connection Defaults soll später im Clienten einstellbar sein.
// ignore: type_annotate_public_apis
const host =  String.fromEnvironment("host",defaultValue : "http://localhost:8888");
