import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationCharacterEntity origin;
  final LocationCharacterEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const CharacterEntity.empty()
      : id = 0,
        name = '',
        status = '',
        species = '',
        type = '',
        gender = '',
        origin = const LocationCharacterEntity.empty(),
        location = const LocationCharacterEntity.empty(),
        image = '',
        episode = const <String>[],
        url = '',
        created = '';

  CharacterEntity copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    LocationCharacterEntity? origin,
    LocationCharacterEntity? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) =>
      CharacterEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

class LocationCharacterEntity extends Equatable {
  const LocationCharacterEntity({required this.name, required this.url});

  final String name;
  final String url;

  const LocationCharacterEntity.empty()
      : name = '',
        url = '';

  LocationCharacterEntity copyWith({String? name, String? url}) =>
      LocationCharacterEntity(name: name ?? this.name, url: url ?? this.url);

  @override
  List<Object?> get props => [name, url];
}
