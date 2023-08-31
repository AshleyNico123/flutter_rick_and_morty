import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHomeDependencies() async {
  unregisterServices();
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}

void unregisterServices() {
  removeRegistrationIfExists<HomeBloc>();
}
