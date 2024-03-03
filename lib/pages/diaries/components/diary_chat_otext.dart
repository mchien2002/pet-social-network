import 'package:flutter/material.dart';

class DiaryChatOtext extends StatelessWidget {
  const DiaryChatOtext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.only(left: 10, right: 12, top: 4, bottom: 4),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(16),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(16)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
