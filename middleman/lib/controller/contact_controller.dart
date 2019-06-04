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
    print(contacts.toString());
    return Response.ok(contacts);
  }

  @Operation.get('id')
  Future<Response> getContactByID(@Bind.path('id') String id) async {
    final contactQuery = Query<Contact>(context)
      ..where((contact) => contact.contactCode).equalTo(id);
    final contact = await contactQuery.fetchOne();
    return Response.ok(contact);
  }

  @Operation.post()
  Future<Response> updateContact(
      @Bind.body() Contact inputContact) async {
    final query = Query<Contact>(context)..values = inputContact;
    final insertedContact = await query.insert();
    return Response.ok(insertedContact);
  }

  @Operation.delete("id")
  Future<Response> deleteContact(@Bind.path('id') String id) async {
    final query = Query<Contact>(context)
      ..where((app) => app.contactCode).equalTo(id);
    int contactdelete = await query.delete();
    return Response.ok(contactdelete);
  }
}