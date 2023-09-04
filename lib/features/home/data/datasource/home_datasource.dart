import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';

abstract class HomeDataSource {
  Future<ResultGetCharactersEntity> getCharacter({required int page});
}
