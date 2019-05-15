import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/appointment.dart';

class AppointmentController extends ResourceController {
  AppointmentController(this.context);

  final ManagedContext context;

  // getall or single
  @Operation.get()
  Future<Response> getAllAppointments({@Bind.query('name') String name}) async {
    final appointmentQuery = Query<Appointment>(context);
    if (name != null) {
      appointmentQuery.where((h) => h.name).contains(name, caseSensitive: false);
    }
    final apointments = await appointmentQuery.fetch();
    print(apointments);
    return Response.ok(apointments);
  }

  @Operation.get('id')
  Future<Response> getAppointmentByID(@Bind.path('id') int id) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((h) => h.id).equalTo(id);

    final appointment = await appointmentQuery.fetchOne();

    if (appointment == null) {
      return Response.notFound();
    }
    return Response.ok(appointment);
  }

  @Operation.post()
  Future<Response> createAppointment(@Bind.body() Appointment inputAppointment) async {
    final query = Query<Appointment>(context)
      ..values = inputAppointment;

    final insertedAppointment = await query.insert();

    return Response.ok(insertedAppointment);
  }
}