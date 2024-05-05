import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/service/api_service.dart';

class DiaryInteract extends StatefulWidget {
  final String postId;
  final int likeCount;
  final int shareCount;
  final int commentCount;

  DiaryInteract({
    Key? key,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
    required this.postId,
  }) : super(key: key);

  @override
  _DiaryInteractState createState() => _DiaryInteractState();
}

class _DiaryInteractState extends State<DiaryInteract> {
  late int likeCount;
  final LocalStorage storage = LocalStorage('pet_app');
  final User userInfo =
      User.fromJson(LocalStorage('pet_app').getItem("userInfo"));
  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    likeCount = widget.likeCount;
  }

  Future<void> likePost() async {
    final newFeedLiked = await apiService.likePost(userInfo.id!, widget.postId);
    setState(() {
      likeCount = newFeedLiked.likeCount ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => likePost(),
                child: ImageIcon(
                  const AssetImage('assets/images/heart.png'),
                  color: likeCount == 0
                      ? const Color(0xff707070)
                      : const Color(0xFFFF3040),
                ),
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
                widget.commentCount.toString(),
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
                widget.shareCount.toString(),
                style: const TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
