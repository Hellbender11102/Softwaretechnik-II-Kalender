import 'package:middleman/middleman.dart';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:test_api/test_api.dart';

export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

class Harness extends TestHarness<CalenderChannel> with TestHarnessORMMixin {
  @override
  ManagedContext get context => channel.context;
  final harness = Harness()
    ..install();
void main() {
  test("GET/heroes returns200 {'key': 'value'}", () async {
    expectResponse(await harness.agent.get("/heroes"), 200, body: {"key": "value"});
  });
}}