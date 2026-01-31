import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required int id,
    required String title,
    required String shortTitle,
    required String slug,
    String? summary,
    required DateTime createdAt,
  }) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
