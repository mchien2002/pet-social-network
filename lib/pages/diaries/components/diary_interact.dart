import 'package:flutter/material.dart';

class DiaryInteract extends StatelessWidget {
  final int likeCount;
  final int shareCount;
  final int commentCount;

  const DiaryInteract(
      {super.key,
      required this.likeCount,
      required this.shareCount,
      required this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ImageIcon(
                AssetImage('assets/images/heart.png'),
                color: Color(0xff707070),
              ),
              Text(
                likeCount.toString(),
                style: const TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
          Row(
            children: [
              const ImageIcon(
                AssetImage('assets/images/Subtract.png'),
                color: Color(0xff707070),
              ),
              Text(
                commentCount.toString(),
                style: const TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
          Row(
            children: [
              const ImageIcon(
                AssetImage('assets/images/share.png'),
                color: Color(0xff707070),
              ),
              Text(
                shareCount.toString(),
                style: const TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
