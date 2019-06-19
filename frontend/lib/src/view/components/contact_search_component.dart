import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:demo/src/model/person.dart';
import 'package:demo/src/view/routes/route_paths.dart';
import 'package:demo/src/view/services/contact_service.dart';


@Component(
  selector: 'contact-search',
  templateUrl: 'contact_search_component.html',
  styleUrls: ['contact_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(ContactService)],
  pipes: [commonPipes],
)
class ContactSearchComponent implements OnInit {

  ContactSearchComponent(this._contactService, this._router);

  ContactService _contactService;
  Router _router;

  Stream<List<Contact>> contacts;
  final StreamController<String> _searchTerms = StreamController<String>.broadcast();



  void search(String term) => _searchTerms.add(term);

  @override
  void ngOnInit() async {
    contacts = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
        ? Stream<List<Contact>>.fromIterable([<Contact>[]])
        : _contactService.search(term).asStream()))
        .handleError(print);
  }

  String _contactUrl(String number) =>
      RoutePaths.contact.toUrl(parameters: {idParam: '$number'});

  Future<NavigationResult> gotoDetail(Contact contact) =>
      _router.navigate(_contactUrl(contact.contactCode));
}
