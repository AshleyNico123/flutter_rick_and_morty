import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicas_flutter/core/inection/injection_container.dart';
import 'package:practicas_flutter/core/routes/app_page_route.dart';
import 'package:practicas_flutter/core/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Mortin-App',
          theme: ThemeData.light().copyWith(
            appBarTheme:
                const AppBarTheme(color: Color.fromRGBO(25, 30, 56, 1)),
          ),
          routes: AppPageRouter.getRoutes(),
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
