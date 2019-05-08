import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/routes/routes.dart';
import 'package:demo/src/view/services/appointment_service.dart';
import 'package:demo/src/view/services/calendar_service.dart';
import 'package:demo/src/view/services/dashboard_service.dart';
import 'package:demo/src/view/services/dayview_service.dart';
import 'package:demo/src/view/services/sample_service.dart';

@Component(
  selector: 'my-cal',
  templateUrl: 'main_component.html',
  directives: [routerDirectives],
  providers: [
    ClassProvider(SampleService),
    ClassProvider(DashboardService),
    ClassProvider(AppointmentService),
    ClassProvider(CalendarService),
    ClassProvider(DayviewService)
    ],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final String title = 'innerComponent';
}
