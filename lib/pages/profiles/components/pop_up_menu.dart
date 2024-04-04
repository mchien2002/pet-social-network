import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/profiles/components/profile_gift.dart';

import '../../../common/const.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: const ImageIcon(
          AssetImage('assets/images/Status_list.png'),
          size: 36,
        ),
      ),
      onSelected: (value) {
        switch (value) {
          case 1:
            print('Cap nhat tt');
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileGift(),
              ),
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Container(
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/Subtract.png')),
                SizedBox(width: 4),
                Expanded(child: Text('Cập nhật thông tin')),
                ImageIcon(AssetImage(Asset.vector)),
              ],
            ),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Container(
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/Subtract.png')),
                SizedBox(width: 4),
                Expanded(child: Text('Đổi quà')),
                ImageIcon(AssetImage(Asset.vector)),
              ],
            ),
          ),
          value: 2,
        ),
        PopupMenuItem(
          child: Container(
            height: 30,
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/Subtract.png')),
                SizedBox(width: 4),
                Expanded(child: Text('Qui định và điều khoản bảo mật')),
                ImageIcon(AssetImage(Asset.vector)),
              ],
            ),
          ),
          value: 3,
        ),
        PopupMenuItem(
          child: Container(
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/images/Subtract.png')),
                SizedBox(width: 4),
                Expanded(child: Text('Log out')),
                ImageIcon(AssetImage(Asset.vector)),
              ],
            ),
          ),
          value: 4,
        ),
      ],
    );
  }
}
