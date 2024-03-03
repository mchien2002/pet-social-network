import 'package:flutter/material.dart';

import 'notify_item.dart';

class NotifyList extends StatefulWidget {
  const NotifyList({super.key});

  @override
  State<NotifyList> createState() => _NotifyListState();
}

class _NotifyListState extends State<NotifyList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NotifyItem(
          img: 'assets/images/avatar1.png',
          name: 'Minh Quang',
          time: '1 ngày trước',
          gender: true,
          add: false,
        ),
        NotifyItem(
          img: 'assets/images/avatar1.png',
          name: 'Hồng Mến',
          time: '1 ngày trước',
          gender: false,
          add: true,
        ),
        NotifyItem(
          img: 'assets/images/avatar1.png',
          name: 'Hồng Mến',
          time: '1 ngày trước',
          gender: false,
          add: true,
        ),
        NotifyItem(
          img: 'assets/images/avatar1.png',
          name: 'Hồng Mến',
          time: '1 ngày trước',
          gender: false,
          add: true,
        ),
      ],
    );
  }
}
