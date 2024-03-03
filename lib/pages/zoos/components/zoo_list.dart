import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tutorialpage/pages/zoos/components/zoo_item.dart';

class ZooList extends StatefulWidget {
  const ZooList({super.key});

  @override
  State<ZooList> createState() => _ZooListState();
}

class _ZooListState extends State<ZooList> {
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
