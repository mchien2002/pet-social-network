import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tutorialpage/constanst.dart';
import 'package:tutorialpage/models/comment_model.dart';
import '../diaries/components/diary_interact.dart';

class NewsFeedItem extends StatefulWidget {
  final String avatar;
  final String name;
  final String time;
  final int likeCount;
  final int shareCount;
  final List<Comments>? comments;
  final String status;
  final List<String>? imageUrls;

  NewsFeedItem({
    Key? key,
    required this.avatar,
    required this.name,
    required this.time,
    required this.likeCount,
    required this.shareCount,
    required this.status,
    this.imageUrls,
    this.comments,
  }) : super(key: key);

  @override
  State<NewsFeedItem> createState() => _NewsFeedItemState();
}

class _NewsFeedItemState extends State<NewsFeedItem> {
  String getUrlImage(String filename) {
    return "$BASE_URL_IMAGE/$filename";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE5E5E5),
            width: 1,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.avatar),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name),
                    Text(
                      widget.time,
                      style: const TextStyle(color: Color(0xff707070)),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(Icons.more_vert),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.status),
              ),
            ),
            // Display images
            if (widget.imageUrls != null) _buildImages(widget.imageUrls!),
            const SizedBox(height: 10),
            DiaryInteract(
              likeCount: widget.likeCount,
              shareCount: widget.shareCount,
              commentCount: widget.comments!.length,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildImages(List<String> imageUrls) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.network(
          getUrlImage(imageUrls[index]),
          fit: BoxFit.cover,
        ),
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
