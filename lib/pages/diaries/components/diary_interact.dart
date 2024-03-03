import 'package:flutter/material.dart';

class DiaryInteract extends StatelessWidget {
  const DiaryInteract({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/heart.png'),
                color: Color(0xff707070),
              ),
              Text(
                '120',
                style: TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/Subtract.png'),
                color: Color(0xff707070),
              ),
              Text(
                '120',
                style: TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/share.png'),
                color: Color(0xff707070),
              ),
              Text(
                '120',
                style: TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
