import 'package:angular_router/angular_router.dart';
import '../components/appointment_component.template.dart' as appointment_template;
import '../components/dashboard_component.template.dart' as dashboard_template;
import '../components/sample_component.template.dart' as sample_template;
import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  // hier wird eine precompiled component eingebunden als sample
  static final RouteDefinition sample = RouteDefinition(
    routePath: RoutePaths.sample,
    component: sample_template.SampleComponentNgFactory,
  );
  static final RouteDefinition dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );
  static final RouteDefinition appointment = RouteDefinition(
    routePath: RoutePaths.appointment,
    component: appointment_template.AppointmentComponentNgFactory,
  );

  // routing auf diese Component
  static final List<RouteDefinition> all = <RouteDefinition>[
    sample,
    dashboard,
    appointment,
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
