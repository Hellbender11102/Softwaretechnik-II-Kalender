import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/view/routes/routes.dart';
import 'package:demo/view/services/sample_service.dart';

@Component(

  selector: 'innerContainer',
  templateUrl: 'main_component.html',
  styleUrls: ['main_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(SampleService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Main Componten';
}