import 'package:flutter/material.dart';
import 'package:map_app/models/article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/timeline.dart';
import 'package:riverpod/riverpod.dart';

/// 投稿フォーム
class PostForm extends ConsumerWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Card(
            child: Column(
          children: [
            const TextField(
              maxLines: 1,
              decoration: InputDecoration(hintText: "title"),
            ),
            Stack(children: [
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(hintText: "main"),
              ),
              const SizedBox(
                height: 32,
              ),
              Positioned(
                right: 10.0, // 右側に10dpのマージンを設定
                bottom: 10.0, // 下側に10dpのマージンを設定
                child: ElevatedButton(
                    onPressed: () {
                      final newArticle = Article(
                          date: DateTime.now(),
                          title: "hoge",
                          text: "fuga",
                          goodNum: 0,
                          badNum: 0);
                      // バックエンドにPOSTする
                      ref
                          .read(timelineNotifierProvider.notifier)
                          .addArticle(newArticle);
                    },
                    child: const Text("POST")),
              ),
            ]),
          ],
        )));
  }
}
