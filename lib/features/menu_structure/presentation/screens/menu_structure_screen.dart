import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:practicas_flutter/features/menu_structure/domain/entities/navigation_item_entity.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';
import 'package:practicas_flutter/features/menu_structure/presentation/widgets/menu_structure_pages.dart';

class MenuStructureScreen extends StatefulWidget {
  const MenuStructureScreen({super.key});

  @override
  State<MenuStructureScreen> createState() => _MenuStructureScreenState();
}

class _MenuStructureScreenState extends State<MenuStructureScreen> {
  late final MenuStructureBloc menuStructureBloc;
  final List<NavigationItemEntity> pages = MenuStructurePages.pages;
  @override
  void initState() {
    menuStructureBloc = context.read<MenuStructureBloc>();
    menuStructureBloc.currentIndex.add(0);
    super.initState();
  }

  @override
  void dispose() {
    menuStructureBloc.currentIndex.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: menuStructureBloc.currentIndex.stream,
        builder: (context, snapshot) {
          return AnimatedBottomNavigationBar(
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            backgroundColor: mainObscureTabNavigation,
            icons: pages.map((e) => e.icon).toList(),
            gapLocation: GapLocation.none,
            activeIndex: snapshot.data ?? 0,
            activeColor: mainYellow,
            inactiveColor: mainWhite,
            onTap: (idx) => menuStructureBloc.currentIndex.add(0),
          );
        });
  }
}
