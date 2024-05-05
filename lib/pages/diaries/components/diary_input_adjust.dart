import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/constanst.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/diaries/components/diary_adjust_item.dart';

import '../../../common/const.dart';

class DiaryInputAdjust extends StatefulWidget {
  const DiaryInputAdjust({super.key});

  @override
  State<DiaryInputAdjust> createState() => _DiaryInputAdjustState();
}

class _DiaryInputAdjustState extends State<DiaryInputAdjust> {
  final User userInfo =
      User.fromJson(LocalStorage('pet_app').getItem("userInfo"));
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
          backgroundImage:
              NetworkImage('$BASE_URL_IMAGE/icons/${userInfo.avatar}'),
          minRadius: 24,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfo.fullname ?? "--",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Row(
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
