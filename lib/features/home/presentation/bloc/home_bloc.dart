import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_flutter/core/entities/character_entity.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';
import 'package:practicas_flutter/features/home/domain/usecases/get_characters_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getCharactersUseCase}) : super(InitHomeState()) {
    on<GetAllCharacters>((event, emit) async {
      await _getCharacter(emit: emit, event: event);
    });
  }

  final GetCharactersUseCase getCharactersUseCase;

  ResultGetCharactersEntity resultGetCharactersEntity =
      ResultGetCharactersEntity.empty();
  List<CharacterEntity> characters = [];

  Future<void> _getCharacter({
    required GetAllCharacters event,
    required Emitter<HomeState> emit,
  }) async {
    emit(LoadingGetAllCharacters());
    final response = await getCharactersUseCase(event.page);
    response.fold(
      (left) {
        log(left.toString());
        emit(FailedGetAllCharacters());
      },
      (right) {
        resultGetCharactersEntity = right;
        characters.addAll(right.results);
        emit(SuccessGetAllCharacters());
      },
    );
  }
}
