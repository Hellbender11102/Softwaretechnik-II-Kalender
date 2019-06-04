import 'harness/app.dart';
 main() async {
  final harness = Harness()..install();

  test("GET /heroes returns 200 {'key': 'value'}", () async {
    expectResponse(await harness.agent.get("/heroes"), 200, body: {"key": "value"});
  });
  /*
  test("Day.isValid(), checks for a valid day", () {
    day = Day(2010,11,11);
    expect(day.isValid(), true);
  });
  */
}
