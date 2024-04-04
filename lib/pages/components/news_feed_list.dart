import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/service/api_service.dart';

import 'news_feed_item.dart';

class NewsFeedList extends StatefulWidget {
  const NewsFeedList({super.key});

  @override
  State<NewsFeedList> createState() => _NewsFeedListState();
}

class _NewsFeedListState extends State<NewsFeedList> {
  final LocalStorage storage = LocalStorage('pet_app');
  List<NewFeed> listNewFeeds = [];
  final apiService = ApiService();
  late User userInfo;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewFeeds();
  }

  Future<void> fetchNewFeeds() async {
    userInfo = User.fromJson(storage.getItem("userInfo"));
    List<NewFeed> newFeeds = await apiService.getOwnPost(userInfo.id!);
    setState(() {
      listNewFeeds = newFeeds;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listNewFeeds.length,
      itemBuilder: (context, index) {
        final item = listNewFeeds[index];
        return NewsFeedItem(
            avatar: item.owner!.avatar ?? "",
            name: item.owner!.fullname ?? '---',
            time: item.createdAt!,
            status: item.title ?? '',
            likeCount: item.likeCount!,
            shareCount: item.shareCount!,
            comments: item.comments,
            imageUrls: item.attachFiles);
      },
    );
  }
}
