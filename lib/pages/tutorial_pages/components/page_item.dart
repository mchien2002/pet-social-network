import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/homes/home_page.dart';

// ignore: must_be_immutable
class PageItem extends StatefulWidget {
  String? img;

  String? title;

  String? text;

  String? textButton;

  PageItem({
    super.key,
    this.img,
    this.title,
    this.textButton,
    this.text,
  });

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.img!, height: 500),
        if (widget.title != null)
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        Expanded(
          child: Text(
            widget.text!,
            style: const TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        if (widget.textButton != null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 44),
              backgroundColor: const Color(0xff66A0F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false)
            },
            child: Text(
              widget.textButton!,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
      ],
    );
  }
}
