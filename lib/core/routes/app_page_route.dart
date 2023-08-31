import 'package:flutter/material.dart';
import 'package:practicas_flutter/core/routes/app_routes.dart';

class AppPageRouter {
  static Widget buildScreenPage(String? route) {
    switch (route) {
      case AppRoutes.home:
        return const SizedBox();
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
