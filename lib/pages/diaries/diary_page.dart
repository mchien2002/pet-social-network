import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_page.dart';
import 'package:pet_social_network/service/api_service.dart';
import 'components/diary_input.dart';
import '../components/news_feed_list.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  dynamic newValue;
  NewFeed? newItem;

  Future<void> refreshPage() async {
    fetchNewFeeds();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nhật ký',
          style: TextStyle(
            color: Color(0xff4890FB),
            fontSize: 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(context: context, builder: (context) => DiaryDialog());
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const DiaryChatPage();
                },
              ));
            },
            icon: Image.asset(
              'assets/images/send.png',
            ),
            padding: const EdgeInsets.only(
              right: 8,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshPage(),
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(), // Bỏ qua giới hạn để làm mới
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiaryInput(
                onResult: (item) {
                  newValue = item;
                  print("New value: ${newValue}");
                },
              ),
              Container(
                color: const Color(0xffE5E5E5),
                height: 10,
              ),
              NewsFeedList(
                listNewFeed: listNewFeeds,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
