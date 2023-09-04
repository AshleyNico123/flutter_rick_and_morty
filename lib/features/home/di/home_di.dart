import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/core/network/server_api_client.dart';
import 'package:practicas_flutter/features/home/data/datasource/home_datasource.dart';
import 'package:practicas_flutter/features/home/data/datasource/home_datasource_impl.dart';
import 'package:practicas_flutter/features/home/data/repository/home_repository_impl.dart';
import 'package:practicas_flutter/features/home/domain/repository/home_repository.dart';
import 'package:practicas_flutter/features/home/domain/usecases/get_characters_usecase.dart';
import 'package:practicas_flutter/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHomeDependencies() async {
  unregisterServices();
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
        getCharactersUseCase: getIt<GetCharactersUseCase>(),
      ));

  // UseCases
  getIt.registerLazySingleton<GetCharactersUseCase>(
    () => GetCharactersUseCase(repository: getIt<HomeRepository>()),
  );

  // Repository and Datasource
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeDataSource: getIt<HomeDataSource>()),
  );
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(serverApiClient: getIt<ServerApiClient>()),
  );
}

void unregisterServices() {
  removeRegistrationIfExists<HomeBloc>();

  // UseCases
  removeRegistrationIfExists<GetCharactersUseCase>();

  // Repository and Datasource
  removeRegistrationIfExists<HomeRepository>();
  removeRegistrationIfExists<HomeDataSource>();
}
