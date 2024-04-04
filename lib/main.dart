import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/auth/login_page.dart';
import 'package:pet_social_network/pages/auth/signup_page.dart';
import 'package:pet_social_network/pages/splashs/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4890FB)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
