import 'package:practicas_flutter/core/entities/character_entity.dart';

StatusCharacter deliveryStatus(String status) {
    switch (status) {
      case 'Alive':
        return StatusCharacter.alive;
      case 'Dead':
        return StatusCharacter.dead;
      case 'unknown':
        return StatusCharacter.unknown;
      default:
        return StatusCharacter.unknown;
    }
  }