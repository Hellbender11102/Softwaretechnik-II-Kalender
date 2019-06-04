import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:demo/src/view/main_component.template.dart' as ng;

import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  ClassProvider(Client, useClass: BrowserClient),
  // Using a real back end?
  // Import 'package:http/browser_client.dlart' and change the above to:
  //   ClassProvider(Client, useClass: BrowserClient),
])
InjectorFactory injector = self.injector$Injector as InjectorFactory;

void main() {
  runApp(ng.AppComponentNgFactory as ComponentFactory, createInjector: injector);
}
