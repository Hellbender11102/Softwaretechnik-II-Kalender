import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/contact_service.dart';




@Component(
  selector: 'contact',
  templateUrl: 'contact_component.html',
  styleUrls: ['contact_component.css'],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
/// Klasse zur verwaltung der Termine
class ContactComponent implements OnActivate {

  ContactComponent(this._contactService, this._location);

  Contact contact = Contact('lauri','Schindler','Laurenz','lauri.s@web.de','295145','Er ist einer');
  final Location _location;

  final ContactService _contactService;

  /// Folgender Code wird immer bei der Aktivierung der Klasse aufgerufen
  @override
  void onActivate(_, RouterState current) async {
    final con = getNumber(current.parameters);
    if (getNumber != null) {
      // ignore: unnecessary_parenthesis
      contact = await (_contactService.get(con));
    }
  }

  /// Methode zum speichern, der änderungen die man im Termin vorgenommen hat
  Future<void> save() async {
    await _contactService.update(contact);
    goBack();
  }

  ///Methode zum löschen von Terminen
  Future<void> delete() async {
    await _contactService.delete(contact.contactCode);
   goBack();
  }

  ///Methode, die die übergeordnete ansicht anzeigt
  void goBack() => _location.back();

}
