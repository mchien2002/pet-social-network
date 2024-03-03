import 'package:flutter/material.dart';

class DiaryChatText extends StatelessWidget {
  const DiaryChatText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.only(left: 12, right: 10, top: 4, bottom: 4),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xff4890FB),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(8)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
