import 'package:middleman/controller/appointment_controller.dart';
import 'package:middleman/controller/contact_controller.dart';
import 'package:middleman/controller/user_controller.dart';

import 'middleman.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class CalenderChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = CalenderConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/appointments/[:id]')
        .link(() => AppointmentController(context));
    router
        .route('/appointments/lookup/[:year/[:month/[:day]]]')
        .link(() => AppointmentController(context));
    router
        .route('/users/[:number]')
        .link(() => UserController(context));
    router
        .route('/contacts/[:number]')
        .link(() => ContactController(context));
    return router;
  }
}

class CalenderConfig extends Configuration {
  CalenderConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
