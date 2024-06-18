import 'package:flutter/material.dart';
import 'package:map_app/article.dart';
import 'package:map_app/post_form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostForm(),
          Article(),
        ],
      ),
    );
  }
}
