import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/appointment.dart';

class AppointmentController extends ResourceController {
  AppointmentController(this.context);

  final _appointments =[
    {"id":1, "name" :"eins","date" : "2019-05-07", "time" : "12:00","duration" : "04:00", "location" : "Technischehochschule Lübeck"},
    {"id":2, "name" :"zwei","date" : "2019-05-07", "time" : "12:00","duration" : "04:00", "location" : "Technischehochschule Lübeck"},
    {"id":3, "name" :"drei","date" : "2019-05-07", "time" : "12:00","duration" : "04:00", "location" : "Technischehochschule Lübeck"},
    {"id":4, "name" :"vier","date" : "2019-05-07", "time" : "12:00","duration" : "04:00", "location" : "Technischehochschule Lübeck"},
    {"id":5, "name" :"fünf","date" : "2019-05-07", "time" : "12:00","duration" : "04:00", "location" : "Technischehochschule Lübeck"},
  ];



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
    ..where((appointment)=> appointment.id).equalTo(id);
    final appointment = await appointmentQuery.fetchOne();
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