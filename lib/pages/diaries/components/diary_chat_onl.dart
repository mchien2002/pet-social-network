import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tutorialpage/models/person_model.dart';
import 'package:tutorialpage/pages/diaries/components/diary_chat_circle.dart';

class DiaryChatOnl extends StatefulWidget {
  DiaryChatOnl({super.key, required this.listPeople});
  List<PersonModel> listPeople;
  @override
  State<DiaryChatOnl> createState() => _DiaryChatOnlState();
}

class _DiaryChatOnlState extends State<DiaryChatOnl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 10, top: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listPeople.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: DiaryChatCircle(
                avatar: widget.listPeople[index].avatar,
                name: widget.listPeople[index].name),
          );
        },
      ),
    );
  }
}
