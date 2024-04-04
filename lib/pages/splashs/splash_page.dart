import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/tutorial_pages/view_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _delay();
    super.initState();
  }

  void _delay() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ViewPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff4890FB),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
