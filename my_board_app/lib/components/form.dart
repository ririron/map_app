import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputForm extends HookConsumerWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textCtrl = useState<TextEditingController>(TextEditingController());

    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(100, 50)),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(3)],
            controller: textCtrl.value,
            decoration: const InputDecoration(hintText: "SPを入力"),
          ),
        ),
        TextButton(onPressed: () {}, child: const Text("記録"))
      ],
    );
  }
}
