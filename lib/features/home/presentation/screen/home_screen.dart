import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/screens/menu_structure_screen.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/widgets/menu_structure_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MenuStructureBloc menuStructureBloc;
  final pages = MenuStructurePages.pages;

  @override
  void initState() {
    menuStructureBloc = context.read<MenuStructureBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: StreamBuilder<int>(
        stream: menuStructureBloc.currentIndex.stream,
        builder: (context, snapshot) => pages[snapshot.data ?? 0].widget,
      ),
      bottomNavigationBar: const MenuStructureScreen(),
    );
  }
}
