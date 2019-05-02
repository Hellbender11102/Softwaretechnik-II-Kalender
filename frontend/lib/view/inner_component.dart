import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/view/routes/routes.dart';
import 'package:demo/view/services/sample_service.dart';

@Component(
  selector: 'my-cal',
  templateUrl: 'inner_component.html',
  directives: [routerDirectives],
  providers: [ClassProvider(SampleService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'innerComponent';
}