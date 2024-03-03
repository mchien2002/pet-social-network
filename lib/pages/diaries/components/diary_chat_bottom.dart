import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DiaryChatBottom extends StatefulWidget {
  Function(String)? onText;
  Function(File)? onFile;
  int id;
  DiaryChatBottom({super.key, this.onText, this.onFile, required this.id});

  @override
  State<DiaryChatBottom> createState() => _DiaryChatBottomState();
}

class _DiaryChatBottomState extends State<DiaryChatBottom> {
  @override
  File? imageFile;
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
  var myController = TextEditingController();
  Widget build(BuildContext context) {
    final timestamp = Timestamp.now();
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: const Icon(
              Icons.menu,
              color: Color(0xff4890FB),
              size: 25,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: const Icon(
              Icons.camera_alt_rounded,
              color: Color(0xff4890FB),
              size: 25,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                pickImage(source: ImageSource.gallery);
              },
              child: const Icon(
                Icons.photo,
                color: Color(0xff4890FB),
                size: 25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: const Icon(
              Icons.mic,
              color: Color(0xff4890FB),
              size: 25,
            ),
          ),
          Expanded(
            child: Container(
              height: 44,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 240, 240),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: myController,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhắn tin',
                    suffixIcon: Icon(
                      Icons.tag_faces_rounded,
                      color: Color(0xff4890FB),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14,
                    )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: GestureDetector(
              onTap: () {
                addUser(timestamp);
                WidgetsBinding.instance.focusManager.primaryFocus
                    ?.unfocus(); // khi an gui thi keyboard dong lai
                setState(() {
                  widget.onText!(myController.text);
                });
                myController.clear();
              },
              child: const ImageIcon(
                AssetImage('assets/images/like.png'),
                color: Color(0xff4890FB),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addUser(Timestamp time) {
    return messages
        .add({
          'text': myController.text,
          'id': widget.id,
          'time': time,
        })
        .then((value) => print("Text Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source, maxHeight: 200, maxWidth: 150);
      if (image?.path != null) {
        File? img = File(image!.path);
        setState(() {
          imageFile = img;
          widget.onFile!(img);
        });
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
