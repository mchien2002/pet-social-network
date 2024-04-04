import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:pet_social_network/models/message.dart';
import 'package:pet_social_network/models/person_model.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_bottom.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_otext.dart';
import 'package:pet_social_network/pages/diaries/components/diary_chat_text.dart';

class DiaryChatDetail extends StatefulWidget {
  PersonModel person;
  DiaryChatDetail({super.key, required this.person});

  @override
  State<DiaryChatDetail> createState() => _DiaryChatDetailState();
}

class _DiaryChatDetailState extends State<DiaryChatDetail> {
  var newText;
  var newFile;
  List<Message> listMess = [];
  bool isChecked = false;
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('message')
      .orderBy('time')
      .snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Color(0xff4890FB)),
        actions: [
          const Icon(Icons.phone, color: Color(0xff4890FB)),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                const ImageIcon(AssetImage('assets/images/camera.png'),
                    color: Color(0xff4890FB)),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.info_rounded, color: Color(0xff4890FB))),
        ],
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.person.avatar),
                  maxRadius: 20,
                ),
                Positioned(
                  bottom: 2,
                  right: 1,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Text(
                widget.person.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(children: [
        Container(
          decoration: const BoxDecoration(
              border: Border.fromBorderSide(
            BorderSide(
              width: 0.1,
              color: Color(0xff707070),
            ),
          )),
        ),
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/images/avatar1.png'),
                ),
              ),
              Text(
                widget.person.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              // get data from firebase
              StreamBuilder<QuerySnapshot>(
                stream: _messageStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: (data['id'] != widget.person.id)
                              ? Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    GestureDetector(
                                      onLongPress: () {
                                        isChecked = true;
                                        setState(() {});
                                      },
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: DiaryChatOtext(
                                              text: data['text'])),
                                    ),
                                    if (isChecked == true)
                                      ReactionButton(
                                          boxElevation: 2,
                                          onReactionChanged: (value) {},
                                          initialReaction: Reaction(
                                              icon: SizedBox(
                                                width: 60,
                                                height: 20,
                                              ),
                                              value: null),
                                          shouldChangeReaction: false,
                                          reactions: [
                                            Reaction(
                                                icon: const Icon(
                                                    Icons.access_alarm),
                                                value: null),
                                            Reaction(
                                                icon: const Icon(Icons
                                                    .beach_access_outlined),
                                                value: null),
                                            Reaction(
                                                icon: const Icon(Icons
                                                    .account_balance_sharp),
                                                value: null),
                                            Reaction(
                                                icon: const Icon(
                                                    Icons.adb_outlined),
                                                value: null),
                                            Reaction(
                                                icon: const Icon(
                                                    Icons.accessible_forward),
                                                value: null),
                                          ]),
                                  ],
                                )
                              : Align(
                                  alignment: Alignment.centerRight,
                                  child: DiaryChatText(text: data['text'])));
                    }).toList(),
                  );
                },
              ),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          child: DiaryChatBottom(
            onText: (value) {
              newText = value;
              print("day la new text: ${newText}");
              listMess.add(
                Message(isSender: true, message: value),
              );
            },
            onFile: (value) {
              newFile = value;
              listMess.add(
                Message(isSender: true, imgFile: value),
              );
              setState(() {});
            },
            id: widget.person.id,
          ),
        ),
      ]),
    );
  }
}
