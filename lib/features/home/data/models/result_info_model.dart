import 'package:practicas_flutter/features/home/domain/entities/result_info_entity.dart';

class ResultInfoModel extends ResultInfoEntity {
  const ResultInfoModel({
    required super.count,
    required super.pages,
    required super.next,
    required super.prev,
  });

  factory ResultInfoModel.fromJson(Map<String, dynamic> json) =>
      ResultInfoModel(
        count: json['count'] ?? 0,
        next: json['next'] ?? '',
        pages: json['pages'] ?? 0,
        prev: json['prev'] ?? '',
      );
}
