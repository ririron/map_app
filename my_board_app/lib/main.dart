import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_app/components/form.dart';
import 'package:map_app/components/graph.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final select = useState<int>(0);

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
                      RadioListTile(
                        // TODO:radiolistに変更
                        title: TextButton(
                          onPressed: () {},
                          child: const Text('ここに記録している対象を表示'),
                        ),
                        value: 0,
                        groupValue: select.value,
                        onChanged: (int? value) {
                          if (value != null) {
                            select.value = value;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const InputForm(),
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
