import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/article_widget.dart';
import 'package:map_app/timeline_notifier.dart';

class TimeLineWidget extends ConsumerWidget {
  const TimeLineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
          itemCount: ref.watch(timelineNotifierProvider).length,
          itemBuilder: (BuildContext context, int idx) {
            return ArticleWidget(
                article: ref.watch(timelineNotifierProvider)[idx]);
          }),
    );
  }
}
