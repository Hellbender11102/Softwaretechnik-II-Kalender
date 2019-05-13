import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/src/view/services/register_service.dart';

@Component(
  selector: 'register',
  templateUrl: 'register_component.html',
  styleUrls: ['register_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)

class RegisterComponent implements OnInit {

  RegisterComponent(this._registerService);

  final RegisterService _registerService;

  Future<void> register() async {

  }

  Future<void> cancel() async {

  }

  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }
}