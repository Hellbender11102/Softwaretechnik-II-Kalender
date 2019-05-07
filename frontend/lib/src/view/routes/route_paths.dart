import 'package:angular_router/angular_router.dart';

const String idParam = 'id';
const String monthParam ="month";
const String yearParam ="year";

class RoutePaths {
  static final RoutePath sample = RoutePath(path: 'sample');
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath calendarMain = RoutePath(path: 'calendar');
  static final RoutePath calendar = RoutePath(path: '${calendarMain.path}/:$yearParam/:$monthParam');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
