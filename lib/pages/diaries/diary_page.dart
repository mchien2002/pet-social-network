import 'package:flutter/material.dart';
import 'package:tutorialpage/models/news_feed_model.dart';
import 'package:tutorialpage/pages/components/news_feed_item.dart';
import 'package:tutorialpage/pages/diaries/components/diary_chat_page.dart';
import 'package:tutorialpage/pages/diaries/components/diary_dialog.dart';
import '../../common/const.dart';
import 'components/diary_input.dart';
import '../components/news_feed_list.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  dynamic newValue;
  NewsFeedModel? newItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nhật ký',
          style: TextStyle(
            color: Color(0xff4890FB),
            fontSize: 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(context: context, builder: (context) => DiaryDialog());
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const DiaryChatPage();
                },
              ));
            },
            icon: Image.asset(
              'assets/images/send.png',
            ),
            padding: const EdgeInsets.only(
              right: 8,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiaryInput(
              onResult: (item) {
                newValue = item;
                print("New value: ${newValue}");
                setState(() {
                  newItem = NewsFeedModel(
                    avatar: Asset.avatar,
                    name: 'Vinh',
                    time: '1 phút trước',
                    status: newValue['status'],
                    imageFile: newValue['list_img'][0],
                  );
                });
                print("New item: ${newItem}");
              },
            ),
            Container(
              color: const Color(0xffE5E5E5),
              height: 10,
            ),
            if (newItem != null)
              NewsFeedItem(
                avatar: newItem!.avatar,
                name: newItem!.name!,
                time: newItem!.time!,
                status: newItem!.status!,
                imgFile: newItem!.imageFile,
              ),
            const NewsFeedList(),
          ],
        ),
      ),
    );
  }
}
