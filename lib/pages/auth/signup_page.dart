import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Đăng Ký",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Địa chỉ email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mật khẩu',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: ElevatedButton(
              onPressed: () {},
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
            text: const TextSpan(
              text: 'Bạn chưa có tài khoản? ',
              style: TextStyle(fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: 'Đăng ký',
                  style: TextStyle(
                    color: Colors.blue, // Màu của phần "Đăng ký"
                    fontWeight: FontWeight.bold,
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
