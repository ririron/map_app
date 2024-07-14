import 'package:map_app/models/article_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timeline.g.dart';

/// バックエンドができるまでの仮notifier

@riverpod
class TimelineNotifier extends _$TimelineNotifier {
  @override
  List<Article> build() {
    return [];
  }

  void addArticle(Article target) {
    state = [...state, target];
  }
}
