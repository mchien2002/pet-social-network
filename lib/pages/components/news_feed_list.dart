import 'package:flutter/material.dart';
import 'package:tutorialpage/common/const.dart';
import 'package:tutorialpage/models/news_feed_model.dart';

import 'news_feed_item.dart';

class NewsFeedList extends StatefulWidget {
  const NewsFeedList({super.key});

  @override
  State<NewsFeedList> createState() => _NewsFeedListState();
}

class _NewsFeedListState extends State<NewsFeedList> {
  List<NewsFeedModel> listModels = [
    NewsFeedModel(
      name: 'Leslie Alexander',
      avatar: Asset.avatar,
      status:
          "Bé golden giới tính cái 55 ngày tuổi cần tìm sen cưng nựng ạ ❤️. Trông con có giống mẹ k ạ 🤣 mọi người quan tâm liên hệ con sen của con nha",
      time: '25 phút trước',
      imageAssets: 'assets/images/group_dogs.png',
    ),
    NewsFeedModel(
        name: "Jerome Bell",
        avatar: Asset.avatar,
        status: "Trố mắt lên mà nhìn !!! Cute phô mai que  😍😍😍",
        time: '13 phút trước'),
    NewsFeedModel(
        name: "Jacob Jones",
        avatar: Asset.avatar,
        status:
            "Bé golden giới tính cái 55 ngày tuổi cần tìm sen cưng nựng ạ ❤️. Trông con có giống mẹ k ạ 🤣 mọi người quan tâm liên hệ con sen của con nha",
        time: '25 phút trước'),
    NewsFeedModel(
        name: "Jacob Jones", avatar: Asset.avatar, time: '25 phút trước'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listModels.length,
      itemBuilder: (context, index) {
        final item = listModels[index];
        return NewsFeedItem(
            avatar: item.avatar,
            name: item.name ?? '---',
            time: item.time!,
            status: item.status ?? '',
            img: item.imageAssets);
      },
    );
  }
}
