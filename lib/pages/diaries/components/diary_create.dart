import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/components/item_picker.dart';
import 'package:tutorialpage/pages/diaries/components/diary_create_sheet.dart';
import 'package:tutorialpage/pages/diaries/components/diary_input_adjust.dart';

class DiaryCreate extends StatefulWidget {
  const DiaryCreate({super.key});
  @override
  State<DiaryCreate> createState() => _DiaryCreateState();
}

class _DiaryCreateState extends State<DiaryCreate> {
  late File imgFile;
  List<File> listImgFile = [];
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Tạo bài viết',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              final data = {
                "list_img": listImgFile,
                "status": myController.text,
              };
              Navigator.of(context).pop(data);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8, top: 10, bottom: 8),
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xff4890FB),
              ),
              child: const Center(
                child: Text(
                  'ĐĂNG',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
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
            const SizedBox(
              height: 10,
            ),
            const DiaryInputAdjust(),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Bạn đang nghĩ gì?',
                    hintStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                    ),
                    border: InputBorder.none),
              ),
            ),
            if (listImgFile.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(left: 8),
                height: 122,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listImgFile.length,
                    itemBuilder: (context, index) {
                      var itemPicker =
                          ItemPicker(imageFile: listImgFile[index]);
                      return itemPicker;
                    },
                  ),
                ),
              ),
            Expanded(child: DiaryCreateSheet(
              onResult: (File value) {
                imgFile = value;
                print("day la img file: ${imgFile}");
                setState(() {
                  listImgFile.add(imgFile);
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
