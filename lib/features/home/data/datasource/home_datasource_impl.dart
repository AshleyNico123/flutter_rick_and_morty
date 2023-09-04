import 'dart:convert';

import 'package:practicas_flutter/core/network/exceptions.dart';
import 'package:practicas_flutter/core/network/server_api_client.dart';
import 'package:practicas_flutter/core/network/server_api_client_constant.dart';
import 'package:practicas_flutter/features/home/data/datasource/home_datasource.dart';
import 'package:practicas_flutter/features/home/data/models/result_get_characters_model.dart';
import 'package:practicas_flutter/features/home/domain/entities/result_get_characters_entity.dart';

class HomeDataSourceImpl extends HomeDataSource {
  HomeDataSourceImpl({required this.serverApiClient});
  final ServerApiClient serverApiClient;

  @override
  Future<ResultGetCharactersEntity> getCharacter({required int page}) async {
    final response = await serverApiClient.get(
      url: ServerApiClientConstant.getAllCharacterEndpoint,
    );
    if (response.statusCode == 200) {
      final jsonResult = json.decode(response.body);
      return ResultGetCharactersModel.fromJson(jsonResult);
    }
    throw ServerException(message: response.reasonPhrase);
  }
}
