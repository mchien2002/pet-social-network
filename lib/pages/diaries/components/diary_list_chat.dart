import 'package:flutter/material.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_circle.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_detail.dart';

class DiaryListChat extends StatefulWidget {
  DiaryListChat({super.key, required this.listPeople});
  List<PersonModel> listPeople;
  @override
  State<DiaryListChat> createState() => _DiaryListChatState();
}

class _DiaryListChatState extends State<DiaryListChat> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.listPeople.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DiaryChatDetail(
                  person: widget.listPeople[index],
                );
              },
            ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                DiaryChatCircle(avatar: widget.listPeople[index].avatar),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.listPeople[index].name),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'ssssssssss',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: Text(widget.listPeople[index].time)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 30,
                  child: Icon(
                    Icons.check_circle,
                    size: 17,
                    color: Color.fromARGB(255, 161, 161, 161),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
