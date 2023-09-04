import 'package:equatable/equatable.dart';
import 'package:practicas_flutter/features/home/data/models/result_info_model.dart';

class ResultInfoEntity extends Equatable {
  const ResultInfoEntity({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final String prev;

  const ResultInfoEntity.empty()
      : count = 0,
        pages = 0,
        next = '',
        prev = '';

  ResultInfoEntity copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) =>
      ResultInfoEntity(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );

  ResultInfoModel toModel() => ResultInfoModel(
        count: count,
        pages: pages,
        next: next,
        prev: prev,
      );

  @override
  List<Object?> get props => [count, pages, next, prev];
}
