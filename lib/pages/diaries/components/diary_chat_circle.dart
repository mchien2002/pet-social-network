import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiaryChatCircle extends StatelessWidget {
  DiaryChatCircle({super.key, required this.avatar, this.name});
  String avatar;
  String? name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatar),
                maxRadius: 28,
              ),
              Positioned(
                bottom: 2,
                right: 1,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          if (name != null)
            Text(
              name!,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
