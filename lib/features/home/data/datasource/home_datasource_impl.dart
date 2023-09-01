import 'package:practicas_flutter/core/entities/character_entity.dart';
import 'package:practicas_flutter/core/network/server_api_client.dart';
import 'package:practicas_flutter/features/home/data/datasource/home_datasource.dart';

class HomeDataSourceImpl extends HomeDataSource {
  HomeDataSourceImpl({required this.serverApiClient});
  final ServerApiClient serverApiClient;

  @override
  Future<CharacterEntity> getCharacter({required int page}) {
    throw UnimplementedError();
  }
}
