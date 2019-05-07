import 'package:angular_router/angular_router.dart';

const String idParam = 'id';

class RoutePaths {
  static final RoutePath sample = RoutePath(path: 'sample');
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath calendarMain = RoutePath(path: 'calendar');
  static RoutePath calendarYear = RoutePath(path: 'calendar/:Year');
  static RoutePath calendarMonth = RoutePath(path: 'calendar/:Year/:Month');
  static RoutePath calendarDay = RoutePath(path: 'calendar/:Year/:Month/:Day');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
