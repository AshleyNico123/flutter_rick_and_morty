import 'package:dartz/dartz.dart';
import 'package:practicas_flutter/core/network/failure.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, ResultGetCharactersEntity>> getCharacter(int page);
}
