import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/service/api_service.dart';

import 'news_feed_item.dart';

class NewsFeedList extends StatefulWidget {
  final List<NewFeed> listNewFeed;
  const NewsFeedList({super.key, required this.listNewFeed});

  @override
  State<NewsFeedList> createState() => _NewsFeedListState();
}

class _NewsFeedListState extends State<NewsFeedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.listNewFeed.length,
      itemBuilder: (context, index) {
        final item = widget.listNewFeed[index];
        return NewsFeedItem(
            avatar: item.owner!.avatar ?? "",
            name: item.owner!.fullname ?? '---',
            time: item.createdAt!,
            status: item.title ?? '',
            likeCount: item.likeCount!,
            shareCount: item.shareCount!,
            comments: item.comments,
            id: item.id!,
            imageUrls: item.attachFiles);
      },
    );
  }
}
