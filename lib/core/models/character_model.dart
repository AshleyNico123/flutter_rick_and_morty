import 'package:practicas_flutter/core/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.origin,
    required super.location,
    required super.image,
    required super.episode,
    required super.url,
    required super.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        status: json['status'] ?? '',
        species: json['species'] ?? '',
        type: json['type'] ?? '',
        gender: json['gender'] ?? '',
        origin: LocationCharacterModel.fromJso(json['origin']),
        location: LocationCharacterModel.fromJso(json['location']),
        image: json['image'] ?? '',
        episode: json['episode'] ?? '',
        url: json['url'] ?? '',
        created: json['created'] ?? '',
      );

  static List<CharacterModel> listFromJson(List<dynamic> list) =>
      list.map((e) => CharacterModel.fromJson(e)).toList();
}

class LocationCharacterModel extends LocationCharacterEntity {
  const LocationCharacterModel({required super.name, required super.url});

  factory LocationCharacterModel.fromJso(Map<String, dynamic> json) =>
      LocationCharacterModel(name: json['name'] ?? '', url: json['url'] ?? '');
}
