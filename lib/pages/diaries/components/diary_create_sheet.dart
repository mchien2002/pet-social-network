import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_social_network/pages/diaries/components/diary_sheet_item.dart';

class DiaryCreateSheet extends StatefulWidget {
  const DiaryCreateSheet({super.key, required this.onResult});
  final Function(File value) onResult;

  @override
  State<DiaryCreateSheet> createState() => _DiaryCreateSheetState();
}

class _DiaryCreateSheetState extends State<DiaryCreateSheet> {
  File? imageFile;

  List<DiarySheetItem> listSheetItems = [
    const DiarySheetItem(
      icon: Icons.image_sharp,
      title: 'Ảnh/video',
      color: Colors.green,
    ),
    const DiarySheetItem(
        icon: Icons.how_to_reg_sharp,
        title: 'Gắn thẻ người khác',
        color: Color.fromARGB(255, 54, 122, 240)),
    const DiarySheetItem(
      icon: Icons.tag_faces_sharp,
      title: 'Cảm xúc/Hoạt động',
      color: Colors.yellow,
    ),
    const DiarySheetItem(
      icon: Icons.location_on_sharp,
      title: 'Check in',
      color: Colors.orange,
    ),
    const DiarySheetItem(
      icon: Icons.video_camera_front_outlined,
      title: 'Video trực tiếp',
      color: Colors.red,
    ),
    const DiarySheetItem(
      icon: Icons.font_download_off_outlined,
      title: 'Màu nền',
      color: Color.fromARGB(255, 120, 156, 121),
    ),
    const DiarySheetItem(
      icon: Icons.camera_alt_rounded,
      title: 'Camera',
      color: Colors.blue,
    ),
    const DiarySheetItem(
        icon: Icons.gif_rounded, title: 'File GIF', color: Colors.greenAccent),
    const DiarySheetItem(
      icon: Icons.music_note_sharp,
      title: 'Nhạc',
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.6,
      minChildSize: 0.1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              controller: scrollController,
              itemCount: listSheetItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (listSheetItems[index].title == 'Ảnh/video') {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text('Camera'),
                                    onTap: () =>
                                        pickImage(source: ImageSource.camera),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.image),
                                    title: const Text('Gallery'),
                                    onTap: () =>
                                        pickImage(source: ImageSource.gallery),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        color: Color(0xffC4C4C4),
                        width: 0.3,
                      ))),
                      child: listSheetItems[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source, maxHeight: 200, maxWidth: 150);
      if (image?.path != null) {
        File? img = File(image!.path);
        setState(() {
          imageFile = img;
        });
        widget.onResult(imageFile!);
        print("Log result in diary create sheet:${widget.onResult}");
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
