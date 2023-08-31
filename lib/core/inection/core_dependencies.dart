import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/core/network/server_api_client.dart';

Future<void> initCoreDependencies() async {
  unregisterServices();
  getIt.registerFactory<ServerApiClient>(() => ServerApiClient());
}

void unregisterServices() {
  removeRegistrationIfExists<ServerApiClient>();
}
