import 'package:angular_router/angular_router.dart';
import '../components/appointment_component.template.dart' as appointment_template;
import '../components/appointment_list_component.template.dart' as appointment_list_template;
import '../components/appointment_new_component.template.dart' as appointment_new_template;
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
  static final RouteDefinition appointments = RouteDefinition(
    routePath: RoutePaths.appointments,
    component: appointment_list_template.AppointmentListComponentNgFactory,
  );
  static final RouteDefinition appointment = RouteDefinition(
    routePath: RoutePaths.appointment,
    component: appointment_template.AppointmentComponentNgFactory,
  );
  static final RouteDefinition appointmentNew = RouteDefinition(
    routePath: RoutePaths.appointmentNew,
    component: appointment_new_template.AppointmentNewComponentNgFactory,
  );

  // routing auf diese Component
  static final List<RouteDefinition> all = <RouteDefinition>[
    sample,
    dashboard,
    appointment,
    appointments,
    appointmentNew,
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
