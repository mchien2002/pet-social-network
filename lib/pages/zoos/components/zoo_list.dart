import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/zoos/components/zoo_item.dart';
import 'package:pet_social_network/service/api_service.dart';

class ZooList extends StatefulWidget {
  const ZooList({super.key});

  @override
  State<ZooList> createState() => _ZooListState();
}

class _ZooListState extends State<ZooList> {
  List<ZooItem> gridZoo = [];
  final apiService = ApiService();
  final User userInfo =
      User.fromJson(LocalStorage('pet_app').getItem("userInfo"));
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewFeeds();
  }

  Future<void> fetchNewFeeds() async {
    List<NewFeed> newFeeds = await apiService.getOwnPost(userInfo.id!);
    setState(() {
      gridZoo = newFeeds
          .where((newFeed) => newFeed.attachFiles!.isNotEmpty)
          .map((newFeed) => ZooItem(
                img: newFeed.attachFiles![0],
                txt: newFeed.title ?? '--',
                name: newFeed.owner?.fullname ?? "--",
                avatar: newFeed.owner?.avatar ?? "--",
              ))
          .cast<ZooItem>()
          .toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 7,
      itemCount: gridZoo.length,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: gridZoo[index],
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(
            index.isEven ? 3 : 4, index.isEven ? 4 : 4.8);
      },
    );
  }
}
