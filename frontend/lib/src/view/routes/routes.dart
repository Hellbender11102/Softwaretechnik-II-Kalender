import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

import '../components/dashboard_component.template.dart'
    as dashboard_template;

import '../components/sample_component.template.dart'
    as sample_template;



export 'route_paths.dart';

class Routes {
  // hier wird eine precompiled component eingebunden als sample
  static final sample = RouteDefinition(
    routePath: RoutePaths.sample,
    component: sample_template.SampleComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  // routing auf diese Component
  static final all = <RouteDefinition>[
    sample,
    dashboard,
    RouteDefinition.redirect(
      path: 'sample',
      redirectTo: RoutePaths.sample.toUrl(),
    ),
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
