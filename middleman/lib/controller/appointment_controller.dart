import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/appointment.dart';

class AppointmentController extends ResourceController {
  AppointmentController(this.context);

  final ManagedContext context;

  /*
  // getall or single
  @Operation.get()
  Future<Response> getAllAppointments() async {
    return Response.ok(_appointments);
  }
  */
  // getall
  @Operation.get()
  Future<Response> getAllAppointments() async {
    logger.warning(request.body.toString());
    final appointmentQuery = Query<Appointment>(context);
    final appointments = await appointmentQuery.fetch();
    if (appointments == null) {
      return Response.notFound();
    }
    return Response.ok(appointments);
  }

  @Operation.get('id')
  Future<Response> getAppointmentByID(@Bind.path('id') int id) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((appointment) => appointment.id).equalTo(id);
    final appointment = await appointmentQuery.fetchOne();
    if (appointment == null) {
      return Response.notFound();
    }
    return Response.ok(appointment);
  }

  @Operation.get('year', "month")
  Future<Response> getAppointmentByMonth(
      @Bind.path('year') int year, @Bind.path('month') int month) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((appointment) => appointment.year).equalTo(year)
      ..where((appointment) => appointment.month).equalTo(month);
    final appointments = await appointmentQuery.fetch();
    if (appointments == null) {
      return Response.notFound();
    }
    return Response.ok(appointments);
  }

  @Operation.get('year', "month", "day")
  Future<Response> getAppointmentByDate(@Bind.path('year') int year,
      @Bind.path('month') int month, @Bind.path('day') int day) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((appointment) => appointment.year).equalTo(year)
      ..where((appointment) => appointment.month).equalTo(month)
      ..where((appointment) => appointment.day).equalTo(day);
    final appointments = await appointmentQuery.fetch();
    if (appointments == null) {
      return Response.notFound();
    }
    return Response.ok(appointments);
  }

  @Operation.post()
  Future<Response> newAppointment() async {
    logger.warning(request.body.toString());
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Appointment>(context)..values.read(body,ignore: ["id"]);
    final insertedApp = await query.insert();

    return Response.ok(insertedApp);
  }

  @Operation.put()
  Future<Response> updateAppointment() async {
    final Map<String, dynamic> body = await request.body.decode();
    logger.warning(request.body.decode());
    final query = Query<Appointment>(context)
      ..values.read(body,ignore: ["id"])
      ..where((app) => app.id).equalTo(body["id"] as int);
    final updatedApp = await query.updateOne();
    return Response.ok(updatedApp);
  }

  @Operation.delete("id")
  Future<Response> deleteAppointment(@Bind.path('id') int id) async {
    final query = Query<Appointment>(context)
      ..where((app) => app.id).equalTo(id);
    int appointmensdelete = await query.delete();
    return Response.ok(appointmensdelete);
  }
}
