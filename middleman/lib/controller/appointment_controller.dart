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
    final appointmentQuery = Query<Appointment>(context);
    final appointments = await appointmentQuery.fetch();
    print(appointments.toString());
    return Response.ok(appointments);
  }

  @Operation.get('id')
  Future<Response> getAppointmentByID(@Bind.path('id') int id) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((appointment) => appointment.id).equalTo(id);
    final appointment = await appointmentQuery.fetchOne();
    return Response.ok(appointment);
  }

  @Operation.get('year', "month")
  Future<Response> getAppointmentByMonth(
      @Bind.path('year') int year, @Bind.path('month') int month) async {
    final appointmentQuery = Query<Appointment>(context)
      ..where((appointment) => appointment.year).equalTo(year)
      ..where((appointment) => appointment.month).equalTo(month);
    final appointments = await appointmentQuery.fetch();
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
    return Response.ok(appointments);
  }

  @Operation.post()
  Future<Response> newAppointment() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Appointment>(context)..values.read(body);
    final insertedHero = await query.insert();

    return Response.ok(insertedHero);
  }
  @Operation.put()
  Future<Response> updateAppointment() async {
    final Map<String, dynamic> body = await request.body.decode();
    print(body.toString());
    final query = Query<Appointment>(context)..values.read(body);
    final insertedHero = await query.insert();

    return Response.ok(insertedHero);
  }



  @Operation.delete("id")
  Future<Response> deleteAppointment(@Bind.path('id') int id) async {
    final query = Query<Appointment>(context)
      ..where((app) => app.id).equalTo(id);
    int appointmensdelete = await query.delete();
    return Response.ok(appointmensdelete);
  }
}
