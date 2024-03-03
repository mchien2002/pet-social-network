import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/adds/add_page.dart';
import 'package:tutorialpage/pages/notifies/notify_page.dart';
import 'package:tutorialpage/pages/diaries/diary_page.dart';
import 'package:tutorialpage/pages/zoos/zoo_page.dart';

import '../profiles/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          DiaryPage(),
          ZooPage(),
          AddPage(),
          NotifyPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffFC508E),
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/diary.png'),
            ),
            label: 'Nhật ký',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Img_load_box_fill.png'),
            ),
            label: 'Vườn thú',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Bell_pin_fill.png'),
            ),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Fire_fill.png'),
            ),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          if (value != 2) _selectedIndex = value;
        }),
      ),
    );
  }
}
