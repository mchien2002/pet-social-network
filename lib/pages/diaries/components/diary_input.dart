import 'package:flutter/material.dart';
import 'diary_create.dart';

class DiaryInput extends StatefulWidget {
  DiaryInput({super.key, required this.onResult});
  Function(dynamic) onResult;

  @override
  State<DiaryInput> createState() => _DiaryInputState();
}

class _DiaryInputState extends State<DiaryInput> {
  dynamic item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: const Color(0xffC4C4C4),
            ),
          ),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar1.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    readOnly: true,
                    onTap: () async {
                      final newItem = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DiaryCreate();
                      }));

                      item = newItem;
                      widget.onResult(item);
                      if (item != null) {
                        print("Success");
                        print("Status: ${item['status']}");
                        print("Image: ${item['list_img']}");
                      }
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffC4C4C4),
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Chia sẻ nhật ký',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 18,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
