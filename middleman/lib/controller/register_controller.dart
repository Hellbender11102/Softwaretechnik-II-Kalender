import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/person.dart';

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    print(user.toString());
    // Check for required parameters before we spend time hashing
    if (user.username == null || user.password == null ){
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      return Response.badRequest(
          body: {"error": "username and password required."});
    }

    print("passiert#######################");
    user.salt = AuthUtility.generateRandomSalt();
    user.hashedPassword = authServer.hashPassword(user.password, user.salt);

    return Response.ok(await Query(context, values: user).insert());
  }
}
