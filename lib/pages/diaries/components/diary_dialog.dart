import 'package:flutter/material.dart';

import '../../../common/const.dart';

class DiaryDialog extends StatefulWidget {
  const DiaryDialog({super.key});

  @override
  State<DiaryDialog> createState() => _DiaryDialogState();
}

class _DiaryDialogState extends State<DiaryDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      title: const Center(child: Text('Đăng Nhập')),
      content: SizedBox(
        height: 380.0,
        width: 300,
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ email',
                hintStyle: TextStyle(
                  color: Color(0xff898888),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nhập mật khẩu',
                hintStyle: TextStyle(
                  color: Color(0xff898888),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                suffixIcon: ImageIcon(
                  AssetImage('assets/images/View_hide_light.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff66A0F9),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Đăng nhập'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Divider(
                      color: Color(0xff898888),
                      height: 10,
                    )),
              ),
              const Text(
                "Đăng nhập khác",
                style: TextStyle(
                  color: Color(0xff898888),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Divider(
                      color: Color(0xff898888),
                      height: 10,
                    )),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4670C9),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                  label: Expanded(child: Text('Đăng nhập với Facebook'))),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE8F1FF),
                    foregroundColor: Color(0xff4670C9),
                  ),
                  onPressed: () {},
                  icon: ImageIcon(AssetImage(Asset.gg1)),
                  label: Expanded(child: Text('Đăng nhập với Google'))),
            ),
            SizedBox(
              height: 10,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Bạn chưa có tài khoản?',
                      style: TextStyle(fontSize: 16)),
                  TextSpan(
                      text: ' Đăng ký',
                      style: TextStyle(
                        color: Color(0xff4670C9),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
