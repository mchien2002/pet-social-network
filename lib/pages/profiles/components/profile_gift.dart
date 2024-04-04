import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/profiles/components/pop_up_menu.dart';
import 'package:pet_social_network/pages/profiles/components/profile_gift_item.dart';
import 'package:pet_social_network/pages/profiles/components/profile_gift_list.dart';

class ProfileGift extends StatefulWidget {
  const ProfileGift({super.key});

  @override
  State<ProfileGift> createState() => _ProfileGiftState();
}

class _ProfileGiftState extends State<ProfileGift> {
  List<ProfileGiftItem> listGift = [
    const ProfileGiftItem(
        img: 'assets/images/gift.png',
        title: 'Pate Monge VetSolution Recovery phục hồi sức khỏe cho chó 150g',
        point: 150),
    const ProfileGiftItem(
        img: 'assets/images/gift.png',
        title: 'Bình treo chuồng vát Mypet 500ml',
        point: 150),
    const ProfileGiftItem(
        img: 'assets/images/gift.png',
        title: 'Thức ăn mềm vịt hầm sổ sung rau',
        point: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Đổi quà',
          style: TextStyle(
            color: Color(0xffFC508E),
            fontSize: 36,
          ),
        ),
        actions: const [
          PopUpMenu(),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 0.5,
                ),
              ),
            ),
          ),
          Flexible(child: ProfileGiftList(listGift: listGift)),
        ],
      ),
    );
  }
}
