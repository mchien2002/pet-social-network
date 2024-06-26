import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/constanst.dart';
import 'package:pet_social_network/models/news_feed_model.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/profiles/components/pop_up_menu.dart';
import 'package:pet_social_network/pages/profiles/components/profile_interact.dart';
import 'package:pet_social_network/pages/profiles/components/profile_mypet.dart';
import 'package:pet_social_network/service/api_service.dart';

import '../components/news_feed_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LocalStorage storage = LocalStorage('pet_app');
  late User userInfo;

  List<NewFeed> listNewFeeds = [];
  final apiService = ApiService();

  Future<void> fetchNewFeeds() async {
    userInfo = User.fromJson(storage.getItem("userInfo"));
    List<NewFeed> newFeeds = await apiService.getOwnPost(userInfo.id!);
    setState(() {
      listNewFeeds = newFeeds;
    });
  }

  Future<void> refreshPage() async {
    setState(() {
      userInfo = User.fromJson(storage.getItem("userInfo"));
    });
    fetchNewFeeds();
  }

  @override
  void initState() {
    userInfo = User.fromJson(storage.getItem("userInfo"));
    fetchNewFeeds();
    super.initState();
  }

  int getYearOld(String birhdate) {
    DateTime now = DateTime.now();
    DateTime birthDate = DateTime.parse(birhdate);
    int age = now.year - birthDate.year;
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Color(0xffFC508E), fontSize: 36),
        ),
        actions: const [
          PopUpMenu(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshPage(),
        child: SingleChildScrollView(
          child: Column(
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
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '$BASE_URL_IMAGE/icons/${userInfo.avatar}'),
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            right: -30,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              shape: const CircleBorder(),
                              child: const ImageIcon(
                                AssetImage('assets/images/Union.png'),
                                color: Color(0xff2C3445),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userInfo.fullname!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/sex.png'),
                              color: Color(0xffFC508E),
                            ),
                            Text(getYearOld(userInfo.birthdate!).toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/Pin_alt_duotone.png'),
                              color: Color(0xffFC508E),
                            ),
                            Text(
                              userInfo.address ?? "Việt Nam",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(child: Image.asset('assets/images/badge.png')),
                  ],
                ),
              ),
              ProfileInteract(
                userInfo: userInfo,
              ),
              const ProfileMypet(),
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
