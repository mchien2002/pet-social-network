import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutorialpage/pages/adds/components/test_page.dart';
import 'package:tutorialpage/pages/adds/components/text_field_date.dart';
import 'package:tutorialpage/pages/components/img_circular_icon.dart';
import 'package:tutorialpage/pages/components/text_field_select.dart';

import '../../components/item_picker.dart';

class AddUpdate extends StatefulWidget {
  const AddUpdate({super.key});

  @override
  State<AddUpdate> createState() => _AddUpdateState();
}

class _AddUpdateState extends State<AddUpdate> {
  List<DropdownMenuItem<String>> menuGenders = [
    const DropdownMenuItem(value: "Nam", child: Text("Nam")),
    const DropdownMenuItem(value: "Nữ", child: Text("Nữ")),
  ];
  List<DropdownMenuItem<String>> menuPets = [
    const DropdownMenuItem(value: "Chó", child: Text("Chó")),
    const DropdownMenuItem(value: "Meo", child: Text("Meo")),
  ];
  String selectedGender = "Nam";
  String selectedPets = "Meo";

  File? listImageFile;
  List<ItemPicker> listPicker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.only(left: 40),
          child: const Text(
            'Cập nhật thông tin',
            style: TextStyle(
              color: Color(0xffFC508E),
              fontSize: 20,
            ),
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
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                color: Color(0xffC4C4C4),
                width: 0.5,
              )),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            margin: const EdgeInsets.only(top: 80),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 70,
                    right: 16,
                    left: 16,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDAEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Họ và tên',
                            labelStyle: TextStyle(
                              color: Color(0xff707070),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDAEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const TextFieldDate(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDAEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextFieldSelect(
                            menuItems: menuGenders,
                            selectedValue: selectedGender,
                            labelText: 'Giới tính'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDAEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextFieldSelect(
                            menuItems: menuPets,
                            selectedValue: selectedPets,
                            labelText: 'Chủng loại thú cưng'),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: -40,
                  right: 160,
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: ImgCircularIcon(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              'Thêm ảnh thú cưng',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
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
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    height: 122,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffA4A3A3),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 37.5,
                    )),
              ),
              if (listImageFile != null)
                Expanded(
                  child: SizedBox(
                    height: 122,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listPicker.length,
                      itemBuilder: (context, index) {
                        return listPicker[index];
                      },
                    ),
                  ),
                ),
            ],
          ),
          Container(
            height: 44,
            margin: const EdgeInsets.only(top: 16),
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TestPage();
                    },
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4890FB),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Cập nhật',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source, maxHeight: 200, maxWidth: 150);
      if (image?.path != null) {
        File? img = File(image!.path);
        setState(() {
          listImageFile = img;
          listPicker.add(ItemPicker(imageFile: img));
          debugPrint("list picker length ? : ${listPicker.length}");
        });
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
