import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localstorage/localstorage.dart';
import '../../../constanst.dart';
import '../../../models/comment_model.dart';
import '../../../models/person_model.dart';
import '../../../service/api_service.dart';

class CommentPage extends StatefulWidget {
  final String name;
  final String time;
  final String status;
  final String postId;
  final String avatar;
  final List<String>? imageUrls;
  final int likeCount;
  final int shareCount;
  final List<Comments>? comments;

  CommentPage({
    required this.name,
    required this.time,
    required this.status,
    required this.likeCount,
    this.imageUrls,
    required this.avatar,
    required this.shareCount,
    required this.postId,
    this.comments,
  });

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final User userInfo = User.fromJson(LocalStorage('pet_app').getItem("userInfo"));
  final ApiService apiService = ApiService();
  final TextEditingController _commentController = TextEditingController();
  List<Comments> _commentList = [];

  @override
  void initState() {
    super.initState();
    _commentList = widget.comments ?? [];
  }

  Future<void> postComment(String postId, String commentContent) async {
    final newComment = await apiService.commentPost(userInfo.id!, postId, commentContent);
    print(newComment);
    setState(() {
      _commentList.add(newComment);
    });
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    print('Image URLs: ${widget.comments}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              // Assuming avatar is the same as the commenter's avatar
                              backgroundImage: NetworkImage(
                                '$BASE_URL_IMAGE/icons/${widget.avatar}',
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name),
                                Text(
                                  widget.time,
                                  style: TextStyle(color: Color(0xff707070)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(widget.status),
                        if (widget.imageUrls != null) _buildImages(widget.imageUrls!),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {
                          // Handle logic when user likes the post here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: () {
                          // Handle logic when user opens comments here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Handle logic when user shares the post here
                        },
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _commentList.length,
                    itemBuilder: (context, index) {
                      final comment = _commentList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            '$BASE_URL_IMAGE/icons/${comment.peopleComment!.avatar}',
                          ),
                        ),
                        title: Text(comment.peopleComment!.fullname.toString()),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(comment.content.toString()),
                            Text(comment.createdAt ?? ''),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Enter your comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String commentContent = _commentController.text;
                    postComment(widget.postId, commentContent);
                  },
                ),
              ],
            ),
          ),
        ],
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

  String getUrlImage(String filename) {
    return "$BASE_URL_IMAGE/images/$filename";
  }
}
