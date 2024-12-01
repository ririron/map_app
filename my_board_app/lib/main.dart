import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/components/graph.dart';
import 'package:map_app/post_form.dart';
import 'package:map_app/timeline_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ExpansionTile(
                    title: const Text('ここで選択'),
                    children: <Widget>[
                      ListTile(
                        // TODO:radiolistに変更
                        title: TextButton(
                          onPressed: () {},
                          child: const Text('ここに記録している対象を表示'),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("記録")),
              ],
            ),
            const SizedBox(
              height: 400,
              child: GraphWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
