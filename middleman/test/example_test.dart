import 'harness/app.dart';

 main() async {
 // final harness = Harness()..install();
/*
  test("GET /heroes returns 200 {'key': 'value'}", () async {
    expectResponse(await harness.agent.get("/heroes"), 200, body: {"key": "value"});
  });
  */

  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });

  test("String.trim() removes surrounding whitespace", () {
    var string = "  foo ";
    expect(string.trim(), equals("foo"));
  });
}
