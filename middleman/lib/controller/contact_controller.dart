/*
 import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:middleman/model/person.dart';

class ContactController extends ResourceController {
  ContactController(this.context);

  final ManagedContext context;

  // getall
  @Operation.get()
  Future<Response> getAllContacts() async {
    final contactQuery = Query<Contact>(context);

    final contacts = await contactQuery.fetch();
    if (contacts == null) {
      return Response.notFound();
    }
    return Response.ok(contacts);
  }

  @Operation.get('number')
  Future<Response> getContactByID(@Bind.path('number') String id) async {
    final contactQuery = Query<Contact>(context)
      ..where((contact) => contact.contactCode).equalTo(id);
    final contact = await contactQuery.fetchOne();
    if (contact == null) {
      return Response.notFound();
    }
    return Response.ok(contact);
  }

  @Operation.post()
  Future<Response> newContact() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Contact>(context)..values.read(body,ignore: ["id"]);
    final insertedCon = await query.insert();

    return Response.ok(insertedCon);
  }

  @Operation.put('number')
  Future<Response> updateContact(@Bind.path('number') String id) async {
    final Map<String, dynamic> body = await request.body.decode();
    print(body.toString());
    final query = Query<Contact>(context)
      ..values.read(body,ignore: ["id"])
      ..where((con) => con.id).equalTo(body["id"] as int);
    final updatedCon = await query.updateOne();
    return Response.ok(updatedCon);
  }


  @Operation.delete("number")
  Future<Response> deleteContact(@Bind.path('number') String id) async {
    final query = Query<Contact>(context)
      ..where((app) => app.contactCode).equalTo(id);
    int contactdelete = await query.delete();
    return Response.ok(contactdelete);
  }
}
*/