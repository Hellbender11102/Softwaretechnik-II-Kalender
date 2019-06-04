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
    print(user.toString());
    return Response.ok(user);
  }

  @Operation.get('con')
  Future<Response> getUserByID(@Bind.path('con') String con) async {
    final userQuery = Query<User>(context)
      ..where((user) => user.contactCode).equalTo(con);
    final user = await userQuery.fetchOne();
    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> updateUser(
      @Bind.body() User inputUser) async {
    final query = Query<User>(context)..values = inputUser;
    final insertedUser = await query.insert();
    return Response.ok(insertedUser);
  }

  @Operation.delete("con")
  Future<Response> deleteUser(@Bind.path('con') String con) async {
    final query = Query<User>(context)
      ..where((app) => app.contactCode).equalTo(con);
    int userdelete = await query.delete();
    return Response.ok(userdelete);
  }
}