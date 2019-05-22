import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/contact_service.dart';

import 'appointment_component.dart';

@Component(
  selector: 'contacts',
  templateUrl: 'contact_list_component.html',
  styleUrls: ['contact_list_component.css'],
  directives: [coreDirectives, routerDirectives, AppointmentComponent, formDirectives],
)

///Klasse zum anzeigen aller contacte
class ContactListComponent implements OnInit {
  ContactListComponent(this._contactService, this._router);

  final ContactService _contactService;
  final Router _router;
  List<Contact> contacts;
  Contact selected;
  String contactCode ="";

  ///Methode zum auswählen eines contacts
  void onSelect(Contact contact) => selected = contact;

  ///Methode die eine Liste aller appointments zurückgibt
  Future<void> _getContacts() async {
    contacts = await list;
  }

  /*Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    appointments.add(await _appointmentService.create(name));
    selected = null;
  }*/

  ///Nachfolgender Code wird bei der inizialisierung der Klasse ausgeführt
  @override
  void ngOnInit() => _getContacts();


  ///Methode die die URL von dem contact mit gegebener id als String zurückgibt
  String _contactUrl(String getCon) {
   return RoutePaths.contact.toUrl(parameters: {conParam: '$getCon'});
  }

  ///Methode die den ausgewählten contact aufruft

  Future<NavigationResult> gotoDetail() {
    _router.navigate(_contactUrl(selected.contactCode));
  }
  Future<void> addContact() async{
    list.add(_contactService.find(contactCode));
  }

}
