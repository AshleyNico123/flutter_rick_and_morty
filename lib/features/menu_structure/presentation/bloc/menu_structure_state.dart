part of 'menu_structure_bloc.dart';

abstract class MenuStructureState {
  const MenuStructureState();
}

class InitMenuStructureState extends MenuStructureState {}

class LoadingMenuStructureState extends MenuStructureState {}

class SuccessMenuStructureState extends MenuStructureState {}
