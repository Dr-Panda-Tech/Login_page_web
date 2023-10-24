import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_frontend/screens/home_page.dart';
import 'package:flutter_frontend/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String? serverURL;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false; // ローディングインジケータの状態

  @override
  void initState() {
    super.initState();
    serverURL = dotenv.env['SERVER_URL'];
    if (serverURL == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('SERVER_URL is not defined in .env file')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: _loginScreen(),
        ));
  }

  Widget _loginScreen() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0), // 上部の余白を小さくする
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 要素を真ん中に配置
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 230,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Login"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // TODO: パスワードリセットの処理を実装する
                      const snackBar = SnackBar(
                        content: Text('パスワードを忘れた場合は、管理者に問い合わせてください。'),
                        duration: Duration(seconds: 3), // 3秒間表示
                      );

                      // SnackBarを表示
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('パスワードを忘れましたか？',
                        style: kHintTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (serverURL == null) return;
    setState(() {
      _isLoading = true;
    }); // リクエストの送信先を確認
    var url = Uri.parse('$serverURL/login');
    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              'username': _usernameController.text,
              'password': _passwordController.text
            },
          ));
      var responseData = json.decode(response.body);
      if (responseData['success']) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed. Please try again.')));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occurred. Please try again later.')));
    } finally {
      setState(() {
        _isLoading = false;  // ここでローディングインジケータを非表示にします
      });
    }
  }
}
