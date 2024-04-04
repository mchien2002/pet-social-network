import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/adds/components/add_info_pet.dart';
import 'package:pet_social_network/pages/adds/components/add_info_user.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../common/const.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  List<Widget> listPets = [
    AddInfoPet(img: Asset.bigImg1),
    AddInfoPet(img: Asset.bigImg2),
    AddInfoPet(img: Asset.bigImg3),
  ];
  late MatchEngine _matchEngine;
  List<SwipeItem> swipeItems = [];
  var checked = true;

  @override
  void initState() {
    reset();

    super.initState();
  }

  void reset() {
    for (var i = 0; i < listPets.length; i++) {
      var swipeItem = SwipeItem(
        content: listPets[i],
      );
      swipeItems.add(swipeItem);
    }
    _matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: const EdgeInsets.only(left: 76),
          child: const Text(
            'Pet Tinder',
            style: TextStyle(color: Color(0xffFC508E), fontSize: 20),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: (const Image(
              image: AssetImage('assets/images/back.png'),
            )),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/adjust.png',
              ),
            ),
          )
        ],
      ),
      body: Column(
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
          const AddInfoUser(),
          const SizedBox(
            height: 20,
          ),
          SwipeCards(
            itemBuilder: (BuildContext context, int index) {
              return Container(child: listPets[index]);
            },
            matchEngine: _matchEngine,
            onStackFinished: () {},
            fillSpace: false,
          ),
        ],
      ),
    );
  }
}
