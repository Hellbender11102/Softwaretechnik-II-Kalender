import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_router/angular_router.dart';
import '../components/appointment_component.template.dart' as appointment_template;
import '../components/appointment_list_component.template.dart' as appointment_list_template;
import '../components/appointment_new_component.template.dart' as appointment_new_template;
import '../components/calendar_main.template.dart' as calendar_template;
import '../components/contact_component.template.dart' as contact_template;
import '../components/contact_list_component.template.dart' as contacts_template;
import '../components/dashboard_component.template.dart' as dashboard_template;
import '../components/dayview_component.template.dart' as dayview_template;

import '../components/login_component.template.dart' as login_template;
import '../components/register_component.template.dart' as register_template;


import 'route_paths.dart';

export 'route_paths.dart';

class Routes {
  // hier wird eine precompiled component eingebunden als sample+
  static final RouteDefinition calendar = RouteDefinition(
    routePath: RoutePaths.calendar,
    component: calendar_template.CalendarComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition appointments = RouteDefinition(
    routePath: RoutePaths.appointments,
    component: appointment_list_template.AppointmentListComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition appointment = RouteDefinition(
    routePath: RoutePaths.appointment,
    component: appointment_template.AppointmentComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition appointmentNew = RouteDefinition(
    routePath: RoutePaths.appointmentNew,
    component: appointment_new_template.AppointmentNewComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition calendarMain = RouteDefinition(
    routePath: RoutePaths.calendarMain,
    component: calendar_template.CalendarComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition dayview = RouteDefinition(
    routePath: RoutePaths.dayview,
    component: dayview_template.DayviewComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition register = RouteDefinition(
    routePath: RoutePaths.register,
    component: register_template.RegisterComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory as ComponentFactory,
    useAsDefault: true,
  );
  static final RouteDefinition contacts = RouteDefinition(
    routePath: RoutePaths.contacts,
    component: contacts_template.ContactListComponentNgFactory as ComponentFactory,
  );
  static final RouteDefinition contact = RouteDefinition(
    routePath: RoutePaths.contact,
    component: contact_template.ContactComponentNgFactory as ComponentFactory,
  );
  // routing auf diese Component
  static final List<RouteDefinition> all = <RouteDefinition>[
    dashboard,
    appointment,
    appointments,
    appointmentNew,
    calendarMain,
    calendar,
    dayview,
    contacts,
    contact,
    register,
    login,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.login.toUrl(),
    ),
  ];
}
