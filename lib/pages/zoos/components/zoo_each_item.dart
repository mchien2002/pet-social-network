import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet_social_network/constanst.dart';
import 'package:pet_social_network/models/news_feed_model.dart';

class ZooEachItem extends StatefulWidget {
  final NewFeed item;
  const ZooEachItem({super.key, required this.item});

  @override
  State<ZooEachItem> createState() => _ZooEachItemState();
}

class _ZooEachItemState extends State<ZooEachItem> {
  String getUrlImage(String filename) {
    return "$BASE_URL_IMAGE/images/$filename";
  }

  String calculateTimeDifference(String inputTime) {
    DateTime postTime = DateTime.parse(inputTime);
    DateTime now = DateTime.now();
    Duration difference = now.difference(postTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút trước';
    } else {
      return 'Vừa đăng';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vườn thú cưng',
          style: TextStyle(
            color: Color(0xff4890FB),
            fontSize: 36,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: (const Image(
              image: AssetImage('assets/images/back.png'),
            )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 0.5,
                )),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      "$BASE_URL_IMAGE/icons/${widget.item.owner!.avatar}"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.owner!.fullname ?? "--",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      calculateTimeDifference(widget.item.createdAt ?? ""),
                      style: const TextStyle(
                        color: Color(0xff958F8F),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 36,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff4890FB),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Theo dõi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.title ?? "--",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
                child: _buildImages(widget.item.attachFiles ?? [])),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: widget.item.likeCount == 0
                      ? const Color(0xff707070)
                      : const Color(0xFFFF3040),
                  size: 30,
                ),
                Text(widget.item.likeCount.toString()),
                const ImageIcon(
                  AssetImage('assets/images/share.png'),
                  color: Color(0xff707070),
                  size: 44,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImages(List<String> imageUrls) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
