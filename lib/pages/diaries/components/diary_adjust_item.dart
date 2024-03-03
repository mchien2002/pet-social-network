import 'package:flutter/material.dart';

class DiaryAdjustItem extends StatefulWidget {
  final Icon icon1;
  final String text;
  const DiaryAdjustItem({super.key, required this.icon1, required this.text});

  @override
  State<DiaryAdjustItem> createState() => _DiaryAdjustItemState();
}

class _DiaryAdjustItemState extends State<DiaryAdjustItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffC4C4C4),
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        widget.icon1,
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Color(
                0xff707070,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_drop_down,
          size: 16,
          color: Color(0xff707070),
        ),
      ]),
    );
  }
}
