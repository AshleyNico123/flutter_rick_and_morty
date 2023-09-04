import 'package:flutter/material.dart';
import 'package:practicas_flutter/features/home/presentation/screen/empty_screen.dart';
import 'package:practicas_flutter/features/home/presentation/screen/list_characters_screen.dart';
import 'package:practicas_flutter/features/menu_structure/domain/entities/navigation_item_entity.dart';

const burnedMessage = 'No implemented view';

class MenuStructurePages {
  static const List<NavigationItemEntity> pages = [
    NavigationItemEntity(
      name: 'Personajes',
      widget: ListCharactersScreen(),
      icon: Icons.abc_outlined,
    ),
    NavigationItemEntity(
      name: 'Ubicaciones',
      widget: EmptyScreen(message: '$burnedMessage Ubicaciones'),
      icon: Icons.ac_unit_sharp,
    ),
    NavigationItemEntity(
      name: 'Episodios',
      widget: EmptyScreen(message: '$burnedMessage Episodios'),
      icon: Icons.access_alarms,
    ),
  ];
}
