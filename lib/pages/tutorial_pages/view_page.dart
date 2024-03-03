import 'package:flutter/material.dart';
import 'package:tutorialpage/common/const.dart';
import 'package:tutorialpage/pages/tutorial_pages/components/page_item.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final pageIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    PageItem(
      img: Asset.img1,
      title: "Vườn thú yêu",
      text: 'Địa điểm giao lưu\n dành cho thú yêu của bạn',
      textButton: null,
    ),
    PageItem(
      img: Asset.img1,
      title: "Pet Tinder",
      text: 'Nơi tình yêu bắt đầu\n dành cho thú yêu của bạn',
      textButton: null,
    ),
    PageItem(
      img: Asset.img1,
      title: "Chia sẻ yêu thương",
      text: 'Nơi chia sẻ những khoảnh khắc\n yêu thương',
      textButton: null,
    ),
    PageItem(
      img: Asset.img1,
      title: null,
      text: 'Nơi chia sẻ những câu chuyện\n thường ngày của hộ yêu thú cưng',
      textButton: "Bắt đầu",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index % _pages.length];
              },
              onPageChanged: (int index) {
                pageIndexNotifier.value = index;
              },
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ValueListenableBuilder<int>(
                  valueListenable: pageIndexNotifier,
                  builder: (context, pageIndex, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(pageIndex),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int pageIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 12.0,
            height: 2.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: pageIndex == i ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      );
    }
    return indicators;
  }
}
