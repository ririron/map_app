import 'package:flutter/material.dart';

/// 投稿フォーム
class PostForm extends StatelessWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("POST")),
              ),
            ]),
          ],
        )));
  }
}
