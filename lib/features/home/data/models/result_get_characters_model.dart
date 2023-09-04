import 'package:practicas_flutter/core/models/character_model.dart';
import 'package:practicas_flutter/features/home/data/models/result_info_model.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';

class ResultGetCharactersModel extends ResultGetCharactersEntity {
  const ResultGetCharactersModel({required super.info, super.results});

  factory ResultGetCharactersModel.fromJson(Map<String, dynamic> json) =>
      ResultGetCharactersModel(
        info: ResultInfoModel.fromJson(json['info'] ?? {}),
        results: (json['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList(),
      );
}
