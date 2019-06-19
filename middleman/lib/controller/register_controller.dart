import 'dart:async';
import 'dart:convert';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/person.dart';
import 'package:http/http.dart' as http; // Must include http package in your pubspec.yaml

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    // Check for required parameters before we spend time hashing
    if (user.username == null || user.password == null ){
      return Response.badRequest(
          body: {"error": "username and password required."});
    }
    logger.warning("hier");
    logger.warning(user.id);
    user.salt = AuthUtility.generateRandomSalt();
    user.hashedPassword = authServer.hashPassword(user.password, user.salt);
    return Response.ok(await Query(context, values: user).insert());
  }

  @Operation.get('number')
  Future<Response> getUserById(@Bind.path('number') String id) async {
    final userQuery = Query<User>(context)
      ..where((con) => con.id).equalTo(id as int);
    final user = await userQuery.fetchOne();
    if (user == null) {
      return Response.notFound();
    }
    return Response.ok(user);
  }
}
