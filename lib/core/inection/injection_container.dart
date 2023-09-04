import 'package:get_it/get_it.dart';
import 'package:practicas_flutter/core/inection/core_dependencies.dart';
import 'package:practicas_flutter/features/home/di/home_di.dart';
import 'package:practicas_flutter/features/menu_structure/di/menu_structure_di.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.pushNewScope();

  await initCoreDependencies();
  await initMenuStructureDependencies();
  await initHomeDependencies();
}

void removeRegistrationIfExists<T extends Object>({String? instanceName}) {
  if (getIt.isRegistered<T>(instanceName: instanceName)) {
    getIt.unregister<T>(instanceName: instanceName);
  }
}
