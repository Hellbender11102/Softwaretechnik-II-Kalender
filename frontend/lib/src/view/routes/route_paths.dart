import 'package:angular_router/angular_router.dart';

const String idParam = 'id';
const String mParam ="month";
const String yParam ="year";

class RoutePaths {
  static final RoutePath sample = RoutePath(path: 'sample');
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath calendarMain = RoutePath(path: 'calendar');
  static final RoutePath calendar = RoutePath(path: '${calendarMain.path}/:$yParam/:$mParam');
  static final RoutePath dayview = RoutePath(path: 'dayview');
}


int getYear(Map<String, String> parameters) {
  final id = parameters[yParam];
  return id == null ? null : int.tryParse(id);
}
int getMonth(Map<String, String> parameters) {
  final id = parameters[mParam];
  return id == null ? null : int.tryParse(id);
}
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
