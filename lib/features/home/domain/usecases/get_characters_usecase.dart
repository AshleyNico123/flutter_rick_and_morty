import 'package:dartz/dartz.dart';
import 'package:practicas_flutter/core/network/failure.dart';
import 'package:practicas_flutter/core/usecases/usecase.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';
import 'package:practicas_flutter/features/home/domain/repository/home_repository.dart';

class GetCharactersUseCase implements UseCase<ResultGetCharactersEntity, int> {
  GetCharactersUseCase({required this.repository});
  final HomeRepository repository;

  @override
  Future<Either<Failure, ResultGetCharactersEntity>> call(int params) async {
    final result = await repository.getCharacter(params);
    return result.fold((failure) => Left(failure), (resp) => Right(resp));
  }
}
