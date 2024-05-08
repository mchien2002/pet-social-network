// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/auth/signup_page.dart';
import 'package:pet_social_network/pages/splashs/splash_page.dart';
import 'package:pet_social_network/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;
  final _service = ApiService();
  final LocalStorage storage = LocalStorage('pet_app');

  @override
  void initState() {
    final userJson = storage.getItem("userInfo");
    if (userJson != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SplashPage();
      }));
    }
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  Future<void> loginButton() async {
    try {
      if (_controllerPassword.text.isNotEmpty &&
          _controllerUsername.text.isNotEmpty) {
        final userLogin = await _service.loginAPI(
            _controllerUsername.text,_controllerPassword.text);
        storage.setItem('userInfo', userLogin.toJson());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SplashPage();
        }));
      }
    } catch (e) {
      _showAlertDialog(context);
    }
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Cảnh báo'),
        content: const Text('Thông tin đăng nhập không đúng'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Đăng Nhập",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: TextField(
              controller: _controllerUsername,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tên đăng nhập',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: TextField(
              controller: _controllerPassword,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mật khẩu',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: ElevatedButton(
              onPressed: () => loginButton(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                minimumSize: Size(MediaQuery.of(context).size.width, 50.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Text('Đăng nhập'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'Bạn chưa có tài khoản? ',
              style: const TextStyle(fontSize: 15),
              children: [
                WidgetSpan(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterPage();
                      }));
                    },
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
