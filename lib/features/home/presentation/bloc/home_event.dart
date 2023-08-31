part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetAllCharacters extends HomeEvent {
  GetAllCharacters({required this.page});
  final int page;
}

class GetAllLocations extends HomeEvent {
  GetAllLocations({required this.page});
  final int page;
}

class GetAllEpisodes extends HomeEvent {
  GetAllEpisodes({required this.page});
  final int page;
}