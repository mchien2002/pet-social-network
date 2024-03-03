import 'package:flutter/material.dart';

class DiarySheetItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color;
  const DiarySheetItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  @override
  State<DiarySheetItem> createState() => _DiarySheetItemState();
}

class _DiarySheetItemState extends State<DiarySheetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: Icon(
              widget.icon,
              size: 30,
              color: widget.color,
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
