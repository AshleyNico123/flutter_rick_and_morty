import 'package:practicas_flutter/core/entities/character_entity.dart';

abstract class HomeDataSource {
  Future<CharacterEntity> getCharacter({required int page});
}