import 'package:flutter/material.dart';

class AddInfoPet extends StatefulWidget {
  AddInfoPet({super.key, required this.img});
  String img;

  @override
  State<AddInfoPet> createState() => _AddInfoPetState();
}

class _AddInfoPetState extends State<AddInfoPet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Image.asset(
              widget.img,
              height: 369,
              width: 320,
              fit: BoxFit.cover,
            ),
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(33, 0, 33, 0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Stack(
                        textDirection: TextDirection.rtl,
                        clipBehavior: Clip.none,
                        fit: StackFit.loose,
                        children: [
                          Positioned(
                            top: -30,
                            right: 80,
                            child: Image.asset('assets/images/x.png'),
                          ),
                          Positioned(
                            right: 10,
                            top: -30,
                            child: Image.asset('assets/images/heart2.png'),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          'Misa',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ImageIcon(AssetImage('assets/images/sex.png'),
                            color: Color(0xffFC508E)),
                        Text(
                          '2 tuổi',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      decoration: const BoxDecoration(
                        color: Color(0xffFC508E),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        '5 km',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
