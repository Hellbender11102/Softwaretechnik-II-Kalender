import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/services/sample_service.dart';


@Component(
  selector: 'sample',
  templateUrl: 'sample_component.html',
  styleUrls: ['sample_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class SampleComponent implements OnInit {
  // service Klasse für ORM
  SampleComponent(this._sampleService);
  final SampleService _sampleService;


  @override
  void ngOnInit() async {
    // do something when drawn
    // like DB connections
  }
}
