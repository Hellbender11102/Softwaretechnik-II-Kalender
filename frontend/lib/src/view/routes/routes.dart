import 'package:angular_router/angular_router.dart';
import '../components/calendar_main.template.dart' as calendar_template;
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
  static final RouteDefinition calendarMain = RouteDefinition(
    routePath: RoutePaths.calendarMain,
    component: calendar_template.CalendarComponentNgFactory,
  );
  static final RouteDefinition calendarYear = RouteDefinition(
    routePath: RoutePaths.calendarMain,
    component: calendar_template.CalendarComponentNgFactory,
  );
  static final RouteDefinition calendarMonth = RouteDefinition(
    routePath: RoutePaths.calendarMain,
    component: calendar_template.CalendarComponentNgFactory,
  );
  static final RouteDefinition calendarDay = RouteDefinition(
    routePath: RoutePaths.calendarMain,
    component: calendar_template.CalendarComponentNgFactory,
  );

  // routing auf diese Component
  static final List<RouteDefinition> all = <RouteDefinition>[
    sample,
    dashboard,
    calendarMain,
    calendarYear,
    calendarMonth,
    RouteDefinition.redirect(
      path: '1234',
      redirectTo: RoutePaths.sample.toUrl(),
    ),
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
