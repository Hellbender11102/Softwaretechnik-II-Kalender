import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/person.dart';

class UserController extends ResourceController {
  UserController(this.context);

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
  Future<Response> getAllUsers() async {
    final userQuery = Query<User>(context);
    final user = await userQuery.fetch();
    return Response.ok(user);
  }

  @Operation.get('number')
  Future<Response> getUserByID(@Bind.path('number') String con) async {
    final userQuery = Query<User>(context)
      ..where((user) => user.contactCode).equalTo(con);
    final user = await userQuery.fetchOne();
    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> newUser() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<User>(context)..values.read(body,ignore: ["id"]);
    final insertedUser = await query.insert();

    return Response.ok(insertedUser);
  }

  @Operation.put('number')
  Future<Response> updateUser(@Bind.path('number') String id) async {
    final Map<String, dynamic> body = await request.body.decode();
    print(body.toString());
    final query = Query<User>(context)
      ..values.read(body,ignore: ["id"])
      ..where((user) => user.id).equalTo(body["id"] as int);
    final updatedUser = await query.updateOne();
    return Response.ok(updatedUser);
  }

  @Operation.delete("number")
  Future<Response> deleteUser(@Bind.path('number') String con) async {
    final query = Query<User>(context)
      ..where((app) => app.contactCode).equalTo(con);
    int userdelete = await query.delete();
    return Response.ok(userdelete);
  }
}