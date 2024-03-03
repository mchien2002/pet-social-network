import 'package:flutter/material.dart';

class ZooAppBar extends StatefulWidget {
  const ZooAppBar({super.key});

  @override
  State<ZooAppBar> createState() => _ZooAppBarState();
}

class _ZooAppBarState extends State<ZooAppBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
            isScrollable: true,
            indicatorPadding: EdgeInsets.only(bottom: 8),
            dividerColor: Colors.transparent,
            indicatorColor: Color(0xff66A0F9),
            tabs: [
              Tab(text: 'Top Trend'),
              Tab(text: 'Gần đây'),
            ]),
      ),
    );
  }
}
