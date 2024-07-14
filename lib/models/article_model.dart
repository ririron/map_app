import 'package:freezed_annotation/freezed_annotation.dart';

part "article_model.freezed.dart";
part 'article_model.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required DateTime date,
    required String title,
    required String text,
    required int goodNum,
    required int badNum,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}
