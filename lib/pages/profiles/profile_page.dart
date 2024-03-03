import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/profiles/components/pop_up_menu.dart';
import 'package:tutorialpage/pages/profiles/components/profile_interact.dart';
import 'package:tutorialpage/pages/profiles/components/profile_mypet.dart';

import '../components/news_feed_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: SingleChildScrollView(
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
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar3.png'),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jonny Dang',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/sex.png'),
                            color: Color(0xffFC508E),
                          ),
                          Text('24 tuổi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/Pin_alt_duotone.png'),
                            color: Color(0xffFC508E),
                          ),
                          Text(
                            'Hà Nội',
                            style: TextStyle(
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
                  Image.asset('assets/images/badge.png'),
                ],
              ),
            ),
            const ProfileInteract(),
            const ProfileMypet(),
            const NewsFeedList(),
          ],
        ),
      ),
    );
  }
}
