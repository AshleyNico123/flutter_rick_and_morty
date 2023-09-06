import 'package:equatable/equatable.dart';
import 'package:practicas_flutter/core/entities/character_entity.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_info_entity.dart';

class ResultGetLocationEntity extends Equatable {
  const ResultGetLocationEntity({
    required this.info,
    this.results = const [],
  });

  final ResultInfoEntity info;
  final List<CharacterEntity> results;

  ResultGetLocationEntity.empty()
      : info = const ResultInfoEntity.empty(),
        results = [];

  @override
  List<Object?> get props => [];
}
