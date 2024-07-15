import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/article_widget.dart';
import 'package:map_app/post_form.dart';
import 'package:map_app/timeline_notifier.dart';
import 'package:map_app/timeline_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostForm(),
          TimeLineWidget(),
        ],
      ),
    );
  }
}
