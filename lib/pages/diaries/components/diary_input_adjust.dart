import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/diaries/components/diary_adjust_item.dart';

import '../../../common/const.dart';

class DiaryInputAdjust extends StatefulWidget {
  const DiaryInputAdjust({super.key});

  @override
  State<DiaryInputAdjust> createState() => _DiaryInputAdjustState();
}

class _DiaryInputAdjustState extends State<DiaryInputAdjust> {
  List<DiaryAdjustItem> listadjust = [
    const DiaryAdjustItem(icon1: Icon(Icons.lock), text: 'Chỉ mình tôi'),
    const DiaryAdjustItem(icon1: Icon(Icons.lock), text: 'Chỉ mình tôi'),
    const DiaryAdjustItem(icon1: Icon(Icons.lock), text: 'Chỉ mình tôi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        CircleAvatar(
          backgroundImage: AssetImage(Asset.avatar),
          minRadius: 24,
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vinh Nguyen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DiaryAdjustItem(
                    icon1: Icon(
                      Icons.lock,
                      size: 16,
                      color: Color(0xff707070),
                    ),
                    text: 'Chỉ mình tôi'),
                DiaryAdjustItem(
                    icon1: Icon(
                      Icons.add,
                      size: 16,
                      color: Color(0xff707070),
                    ),
                    text: 'Album'),
                DiaryAdjustItem(
                    icon1: Icon(
                      Icons.facebook_sharp,
                      size: 16,
                      color: Color(0xff707070),
                    ),
                    text: 'Tắt'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
