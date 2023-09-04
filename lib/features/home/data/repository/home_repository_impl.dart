import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:practicas_flutter/core/network/failure.dart';
import 'package:practicas_flutter/features/home/data/datasource/home_datasource.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';
import 'package:practicas_flutter/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.homeDataSource});
  final HomeDataSource homeDataSource;

  @override
  Future<Either<Failure, ResultGetCharactersEntity>> getCharacter(
    int page,
  ) async {
    try {
      final result = await homeDataSource.getCharacter(page: page);
      return Right(result);
    } on ServerFailure catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: e.toString()));
    } on ConnectionFailure catch (e) {
      log(e.toString());
      return Left(ConnectionFailure(message: e.toString()));
    } on Object catch (e) {
      log(e.toString());
      return Left(ErrorFailure(error: e.toString()));
    }
  }
}
