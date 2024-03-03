import 'package:flutter/material.dart';

class ImgCircularIcon extends StatefulWidget {
  const ImgCircularIcon({super.key});

  @override
  State<ImgCircularIcon> createState() => _ImgCircularIconState();
}

class _ImgCircularIconState extends State<ImgCircularIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar3.png'),
        ),
        Positioned(
          bottom: -4,
          right: -30,
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: const Color(0xFFF5F6F9),
            shape: const CircleBorder(),
            child: const ImageIcon(
              AssetImage('assets/images/Union.png'),
              color: Color(0xff2C3445),
            ),
          ),
        ),
      ],
    );
  }
}
