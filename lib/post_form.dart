import 'package:flutter/material.dart';
import 'package:map_app/models/article_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_app/timeline_notifier.dart';

/// 投稿フォーム
class PostForm extends HookConsumerWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleCtrl = useTextEditingController();
    final mainCtrl = useTextEditingController();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Card(
            child: Column(
          children: [
            TextField(
              maxLines: 1,
              decoration: const InputDecoration(hintText: "title"),
              controller: titleCtrl,
            ),
            Stack(children: [
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(hintText: "main"),
                controller: mainCtrl,
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
                          title: titleCtrl.text,
                          text: mainCtrl.text,
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
