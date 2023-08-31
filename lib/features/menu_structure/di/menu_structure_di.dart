import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';

Future<void> initMenuStructureDependencies() async {
  unregisterServices();
  getIt.registerFactory<MenuStructureBloc>(() => MenuStructureBloc());
}

void unregisterServices() {
  removeRegistrationIfExists<MenuStructureBloc>();
}
