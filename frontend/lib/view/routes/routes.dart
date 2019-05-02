import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import '../components/sample_component.template.dart' as sample_component_template;

export 'route_paths.dart';

class Routes {

  // hier wird eine precompompiled component eingebunden als sample
  static final sample = RouteDefinition(
    routePath: RoutePaths.sample,
    component: sample_component_template.SampleComponentNgFactory,
  );
  // routing auf diese Component
  static final all = <RouteDefinition>[
    sample,
    RouteDefinition.redirect(
      path: 'sample',
      redirectTo: RoutePaths.sample.toUrl(),
    ),
  ];
}
