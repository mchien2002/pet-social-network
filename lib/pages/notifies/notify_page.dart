import 'package:flutter/material.dart';

import 'components/notify_list.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông báo',
          style: TextStyle(color: Color(0xff4890FB), fontSize: 36),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                color: Color(0xffC4C4C4),
                width: 0.5,
              )),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const NotifyList(),
        ],
      ),
    );
  }
}
