import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/components/login_component.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/contact_service.dart';

import 'contact_component.dart';
import 'contact_search_component.dart';

@Component(
  selector: 'contacts',
  templateUrl: 'contact_list_component.html',
  styleUrls: ['contact_list_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives, ContactComponent, ContactSearchComponent],
)

///Klasse zum anzeigen aller Kontakte
class ContactListComponent implements OnInit, OnActivate {
  ContactListComponent(this._contactService, this._router);

  final ContactService _contactService;
  final Router _router;
  List<Contact> contacts;
  String contactCode ="";
  bool valid = true;
  bool exists = false;
  bool deleteControl = false;

  ///Methode die eine Liste aller appointments zurückgibt
  Future<void> _getContacts() async {
    contacts = await _contactService.getAll();
  }


  ///Nachfolgender Code wird bei der inizialisierung der Klasse ausgeführt
  @override
  void ngOnInit() => _getContacts();


  ///Methode die die URL von dem contact mit gegebener id als String zurückgibt
  String _contactUrl(String getCon) {
   return RoutePaths.contact.toUrl(parameters: {conParam: '$getCon'});
  }

  ///Methode die den ausgewählten contact aufruft

  Future<NavigationResult> gotoDetail(Contact contact) =>_router.navigate(_contactUrl(contact.contactCode));

  Future<void> addContact() async {
    if (contacts.any((h) => h.contactCode == contactCode)) {
      exists = true;
      valid = true;
    } else {
      final Contact contact = await _contactService.find(contactCode);
      if (contact == null) {
        valid = false;
        exists = false;
      } else {
        print(contacts);
        await _contactService.create(contact);
        await _getContacts();
        valid = true;
        exists = false;
      }
    }
  }

  ///Funktion die immer beim erstellen aufgerufen wird
  @override
  Future onActivate(RouterState previous, RouterState current) async {
    if (!LoginComponent.loggedIn) {
      await _router.navigate('/login');
    }
  }

  ///funktion zum löschen eines Kontakts
  Future<void> delete(Contact contact) async {
    if (deleteControl==true) {
      await _contactService.delete(contact.contactCode);
      await _getContacts();
      deleteControl = false;
    } else {
      deleteControl = true;
    }
  }

}
