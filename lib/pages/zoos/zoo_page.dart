import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/zoos/components/zoo_appbar.dart';

import 'components/zoo_item.dart';
import 'components/zoo_list.dart';

class ZooPage extends StatefulWidget {
  const ZooPage({super.key});

  @override
  State<ZooPage> createState() => _ZooPageState();
}

class _ZooPageState extends State<ZooPage> {
  List<ZooItem> gridZoo = [
    const ZooItem(
        img: 'assets/images/person2.png',
        txt: 'Misa iu thía ^^',
        name: 'Trần Trà My'),
    const ZooItem(
        img: 'assets/images/person1.png',
        txt: 'Misa iu thía ^^',
        name: 'Trần Trà My'),
    const ZooItem(
        img: 'assets/images/person2.png',
        txt: 'Misa iu thía ^^',
        name: 'Trần Trà My'),
    const ZooItem(
        img: 'assets/images/person1.png',
        txt: 'Misa iu thía ^^',
        name: 'Trần Trà My'),
  ];

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
