import 'package:flutter/material.dart';
import 'package:flutter_frontend/utils/constants.dart';
import 'package:flutter_frontend/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Future<void> showLogoutConfirmationDialog(
      BuildContext context, Function onConfirmed) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ログアウト'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('本当にログアウトしますか？'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'キャンセル',
                style: kHintTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'OK',
                style: kHintTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirmed();
              },
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    // 前の画面に戻る
    // ログイン画面に移動し、以前のすべてのルートを削除する
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ログイン成功',
              style: kResultTextStyle,
            ),
            const SizedBox(height: 20), // 余白を追加
            Image.asset('assets/images/main_character.png'),  // 画像を表示
            const SizedBox(height: 20), //
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  showLogoutConfirmationDialog(context, _logout);
                },
                child: const Text(
                  'ログアウトする',
                  style: kHintTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
