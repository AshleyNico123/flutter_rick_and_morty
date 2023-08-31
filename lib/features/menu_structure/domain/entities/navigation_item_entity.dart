import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationItemEntity  extends Equatable  {
  const NavigationItemEntity({required this.name, required this.widget, required this.icon});
  final String name;
  final Widget widget;
  final IconData icon;
  
  @override
  List<Object?> get props => [name, widget, icon];
}
