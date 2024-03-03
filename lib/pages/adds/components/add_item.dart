import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final int num;
  final String txt;
  final String img1;
  final String img2;

  const AddItem({
    super.key,
    required this.num,
    required this.txt,
    required this.img1,
    required this.img2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFC508E),
                ),
                child: Text(
                  num.toString(),
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                txt,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset(img1),
              SizedBox(width: 40),
              Image.asset(img2),
            ],
          ),
        ],
      ),
    );
  }
}
