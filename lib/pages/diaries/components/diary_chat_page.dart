import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_onl.dart';
import 'package:pet_social_network/pages/diaries/components/diary_list_chat.dart';
import '../../../models/person_model.dart';

class DiaryChatPage extends StatefulWidget {
  const DiaryChatPage({super.key});

  @override
  State<DiaryChatPage> createState() => _DiaryChatPageState();
}

class _DiaryChatPageState extends State<DiaryChatPage> {
  int _selectedIndex = 0;
  List<PersonModel> listPeople = [
    PersonModel(
      id: 1,
      avatar: 'assets/images/avatar1.png',
      name: 'Le Minh Duc',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 2,
      avatar: 'assets/images/avatar1.png',
      name: 'Hien Le',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 3,
      avatar: 'assets/images/avatar1.png',
      name: 'Phi Tai Minh',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 4,
      avatar: 'assets/images/avatar1.png',
      name: 'Do Minh Quan',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 5,
      avatar: 'assets/images/avatar1.png',
      name: 'Le Hai Dang',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 6,
      avatar: 'assets/images/avatar1.png',
      name: 'Nguyen Van Minh',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 7,
      avatar: 'assets/images/avatar1.png',
      name: 'Duong Minh Hung',
      time: '15:23',
      isSender: true,
    ),
    PersonModel(
      id: 8,
      avatar: 'assets/images/avatar1.png',
      name: 'Vinh Nguyen',
      time: '15:23',
      isSender: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Đoạn chat',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        leading: const Icon(Icons.menu_sharp),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: const Icon(
              Icons.camera_alt_rounded,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 16,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 240, 240),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm",
                  hintStyle: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 16,
                  ),
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff707070),
                    size: 21,
                  ),
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            DiaryChatOnl(listPeople: listPeople),
            DiaryListChat(listPeople: listPeople),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Đoạn chat',
            icon: ImageIcon(
              AssetImage('assets/images/chat.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cuộc gọi',
            icon: ImageIcon(
              AssetImage('assets/images/camera.png'),
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
              label: 'Danh bạ',
              icon: Icon(
                Icons.people_alt_rounded,
                size: 28,
              )),
          BottomNavigationBarItem(
              label: 'Tin', icon: Icon(Icons.bookmarks_rounded)),
        ],
      ),
    );
  }
}
