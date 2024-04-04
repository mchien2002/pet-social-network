import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/profiles/components/profile_gift_item.dart';

class ProfileGiftList extends StatefulWidget {
  final List<ProfileGiftItem> listGift;
  const ProfileGiftList({super.key, required this.listGift});

  @override
  State<ProfileGiftList> createState() => _ProfileGiftListState();
}

class _ProfileGiftListState extends State<ProfileGiftList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listGift.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.listGift[index];
        });
  }
}
