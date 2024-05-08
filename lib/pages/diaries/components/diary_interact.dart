import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/service/api_service.dart';

import '../../../models/comment_model.dart';
import 'comment_page.dart';

class DiaryInteract extends StatefulWidget {
  final String postId;
  final String avatar;
  final String name;
  final String status;
  final int likeCount;
  final String time;
  final List<Comments>? comments;
  final int shareCount;
  final int commentCount;
  final List<String>? imageUrls;

  DiaryInteract({
    Key? key,
    required this.avatar,
    required this.likeCount,
    required this.name,
    required this.shareCount,
    required this.status,
    required this.time,
    required this.comments,
    required this.commentCount,
    required this.postId,
    this.imageUrls
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

  void goToCommentPage() {
    // Code chuyển hướng đến trang comment ở đây
    // Ví dụ:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CommentPage(postId: widget.postId, avatar: widget.avatar,comments: widget.comments, name: widget.name, time: widget.time, status: widget.status, likeCount: widget.likeCount, shareCount: widget.shareCount,imageUrls: widget.imageUrls,)),
    );
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
              InkWell(
                onTap: () => goToCommentPage(), // Gọi hàm khi nhấn vào biểu tượng comment
                child: ImageIcon(
                  AssetImage('assets/images/Subtract.png'),
                  color: Color(0xff707070),
                ),
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
