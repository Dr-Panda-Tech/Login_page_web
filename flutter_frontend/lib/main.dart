import 'package:flutter/material.dart';
import 'package:flutter_frontend/utils/constants.dart';
import 'package:flutter_frontend/screens/login_page.dart';
import 'package:flutter_frontend/screens/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnv(bool isProd) async {
  final envPath = isProd ? '/env/.env_prod' : '/env/.env_local';
  await dotenv.load(fileName: envPath);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const isProd = false; // このフラグを変更して環境を切り替えます
  await loadEnv(isProd);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: pandaTheme,
      home: const LoginPage(),
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
