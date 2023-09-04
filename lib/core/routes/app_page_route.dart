import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/core/routes/app_routes.dart';
import 'package:practicas_flutter/features/home/domain/usecases/get_characters_usecase.dart';
import 'package:practicas_flutter/features/home/presentation/bloc/home_bloc.dart';
import 'package:practicas_flutter/features/home/presentation/screen/home_screen.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';

class AppPageRouter {
  static Widget buildScreenPage(String? route) {
    switch (route) {
      case AppRoutes.home:
        return MultiBlocProvider(
          providers: [
            BlocProvider<MenuStructureBloc>(create: (_) => MenuStructureBloc()),
            BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(
                getCharactersUseCase: getIt<GetCharactersUseCase>(),
              ),
            )
          ],
          child: const HomeScreen(),
        );
      default:
        return const SizedBox();
    }
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() =>
      <String, Widget Function(BuildContext)>{
        AppRoutes.home: (BuildContext context) =>
            buildScreenPage(AppRoutes.home)
      };
}
