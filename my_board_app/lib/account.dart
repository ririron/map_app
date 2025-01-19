import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  LogInPageState createState() => LogInPageState();
}

class LogInPageState extends ConsumerState<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm({bool makeFlag = false}) {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // ここで認証ロジックを追加します
      print("Username: $username");
      print("Password: $password");
    }
  }

  @override
  Widget build(BuildContext context) {
    const double textBoxLength = 500;
    const double idPassMargin = 30.0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text('Logged In Page'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: textBoxLength,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "ユーザー名",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "ユーザー名を入力してください";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: idPassMargin,
                ),
                SizedBox(
                  width: textBoxLength,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "パスワード",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "パスワードを入力してください";
                      }
                      if (value.length < 8) {
                        return "8文字以上のパスワードにしてください";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: idPassMargin,
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("ログイン"),
                ),
                const SizedBox(
                  height: idPassMargin,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("アカウント作成"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
