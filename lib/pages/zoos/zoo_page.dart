import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/zoos/components/zoo_appbar.dart';
import 'package:pet_social_network/service/api_service.dart';

import 'components/zoo_item.dart';
import 'components/zoo_list.dart';

class ZooPage extends StatefulWidget {
  const ZooPage({super.key});

  @override
  State<ZooPage> createState() => _ZooPageState();
}

class _ZooPageState extends State<ZooPage> {
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
                newFeed: newFeed,
              ))
          .cast<ZooItem>()
          .toList();
      isLoading = false;
    });
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                color: Color(0xffC4C4C4),
                width: 0.5,
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xff878787), width: 0.1),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const TextField(
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff878787),
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xff878787)),
                border: InputBorder.none,
                hintText: 'Tìm kiếm',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ZooAppBar(),
          const Expanded(child: ZooList()),
        ],
      ),
    );
  }
}
