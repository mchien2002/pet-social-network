// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_social_network/constanst.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/auth/login_page.dart';
import 'package:pet_social_network/service/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controllerUsername = TextEditingController();
  final _controllerFullname = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerReconfirmPassword = TextEditingController();
  final _service = ApiService();

  DateTime date = DateTime(2016, 10, 26);
  PetType _selectedPetType = PetType.DOG;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void signupUser() async {
    try {
      if (_controllerPassword.text != _controllerReconfirmPassword.text) {
        _showAlertDialog(context, "Mật khẩu không trùng khớp");
        _controllerPassword.clear();
        _controllerReconfirmPassword.clear();
      } else {
        final newUser = UserCreateRequest(
            username: _controllerUsername.text,
            fullname: _controllerFullname.text,
            birthdate: DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").format(date),
            petType: _selectedPetType.value,
            password: _controllerReconfirmPassword.text);

        await _service.signupAPI(newUser);
        _showAlertDialog(context, "Tạo tài khoản thành công");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }));
      }
    } catch (e) {
      _showAlertDialog(context, "Lỗi khi tạo tài khoản");
    }
  }

  void _showAlertDialog(BuildContext context, String waning) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Cảnh báo'),
        content: Text(waning),
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
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: TextField(
                controller: _controllerFullname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Họ và tên',
                ),
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sinh nhật",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This shows day of week alongside day of month
                        showDayOfWeek: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => date = newDate);
                        },
                      ),
                    ),
                    child: Text(
                      '${date.month}-${date.day}-${date.year}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Thú cưng của bản là gì",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<PetType>(
                      value: _selectedPetType,
                      items: PetType.values.map((petType) {
                        return DropdownMenuItem<PetType>(
                          value: petType,
                          child: Text(petType.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedPetType = newValue!;
                        });
                      },
                    ),
                  ),
                ],
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
              child: TextField(
                controller: _controllerReconfirmPassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập lại mật khẩu',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: ElevatedButton(
                onPressed: () => signupUser(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text('Đăng ký'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: 'Đã có tài khoản? ',
                style: const TextStyle(fontSize: 15),
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: const Text(
                        'Đăng nhập',
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
      ),
    );
  }
}
