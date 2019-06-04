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

  @Operation.get('con')
  Future<Response> getContactByID(@Bind.path('con') String id) async {
    final contactQuery = Query<Contact>(context)
      ..where((contact) => contact.contactCode).equalTo(id);
    final contact = await contactQuery.fetchOne();
    if (contact == null) {
      return Response.notFound();
    }
    return Response.ok(contact);
  }

  @Operation.post()
  Future<Response> updateContact(
      @Bind.body() Contact inputContact) async {
    final query = Query<Contact>(context)..values = inputContact;
    final insertedContact = await query.insert();
    return Response.ok(insertedContact);
  }

  @Operation.delete("con")
  Future<Response> deleteContact(@Bind.path('con') String id) async {
    final query = Query<Contact>(context)
      ..where((app) => app.contactCode).equalTo(id);
    int contactdelete = await query.delete();
    return Response.ok(contactdelete);
  }
}