import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/adds/components/add_info.dart';
import 'package:tutorialpage/pages/adds/components/add_item.dart';

class AddList extends StatelessWidget {
  const AddList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          const SizedBox(
            height: 50,
          ),
          const AddItem(
              num: 1,
              txt: 'Chọn giới tính pet',
              img1: 'assets/images/male.png',
              img2: 'assets/images/female.png'),
          const AddItem(
              num: 2,
              txt: 'Chọn loại pet',
              img1: 'assets/images/dog.png',
              img2: 'assets/images/cat.png'),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 43),
                backgroundColor: const Color(0xffFC508E),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddInfo();
                    },
                  ),
                );
              },
              child: const Text(
                'Bắt đầu kết nối',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
        ]),
      ],
    );
  }
}
