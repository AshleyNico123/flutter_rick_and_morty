part of 'home_bloc.dart';


abstract class HomeState {}

class InitHomeState extends HomeState {}

// Characters
class InitGetAllCharacters extends HomeState {}
class LoadingGetAllCharacters extends HomeState {}
class FailedGetAllCharacters extends HomeState {}
class SuccessGetAllCharacters extends HomeState {}

// Locations
class InitGetAllLocations extends HomeState {}
class LoadingGetAllLocations extends HomeState {}
class FailedGetAllLocations extends HomeState {}
class SuccessGetAllLocations extends HomeState {}

//  Episodes
class InitGetAllEpisodes extends HomeState {}
class LoadingGetAllEpisodes extends HomeState {}
class FailedGetAllEpisodes extends HomeState {}
class SuccessGetAllEpisodes extends HomeState {}