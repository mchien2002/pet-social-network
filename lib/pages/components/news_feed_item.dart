import 'dart:io';

import 'package:flutter/material.dart';

import '../diaries/components/diary_interact.dart';

class NewsFeedItem extends StatefulWidget {
  final String avatar;
  final String name;
  final String time;
  final String status;
  String? img;
  File? imgFile;

  NewsFeedItem(
      {super.key,
      required this.avatar,
      required this.name,
      required this.time,
      required this.status,
      this.img,
      this.imgFile});

  @override
  State<NewsFeedItem> createState() => _NewsFeedItemState();
}

class _NewsFeedItemState extends State<NewsFeedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Color(0xffE5E5E5),
          width: 1,
        )),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.avatar),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name),
                    Text(
                      widget.time,
                      style: const TextStyle(color: Color(0xff707070)),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.more_vert,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(widget.status))),
            if (widget.img != null) Image.asset(widget.img!),
            if (widget.imgFile != null)
              Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 16),
                  height: 300,
                  width: 320,
                  child: Image.file(
                    widget.imgFile!,
                    fit: BoxFit.cover,
                  )),
            if (widget.img == null && widget.imgFile == null)
              const SizedBox(
                height: 10,
              ),
            const DiaryInteract(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
