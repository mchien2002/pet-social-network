import 'package:flutter/material.dart';

class ProfileConnect extends StatefulWidget {
  const ProfileConnect({super.key});

  @override
  State<ProfileConnect> createState() => _ProfileConnectState();
}

class _ProfileConnectState extends State<ProfileConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 30),
          child: const Text(
            'Kết nối yêu thương',
            style: TextStyle(
              color: Color(0xff4890FB),
              fontSize: 20,
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
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
      body: Container(
        margin: const EdgeInsets.only(
          top: 80,
          left: 28,
          right: 28,
        ),
        child: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 280,
                  child: Row(
                    children: [
                      Expanded(
                        child: Expanded(
                          child: Image.asset(
                            'assets/images/dogg1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/dogg2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Misa',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('assets/images/sex.png'),
                              size: 24,
                              color: Color(0xffFC508E),
                            ),
                            Text(
                              '2 tuổi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Mickey',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('assets/images/sex.png'),
                              size: 24,
                              color: Color(0xffFC508E),
                            ),
                            Text(
                              '2 tuổi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Positioned(
            right: 140,
            bottom: 60,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFC508E),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Positioned(
            bottom: -28,
            right: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  backgroundColor: Color(0xff4890FB),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Bắt đầu trò chuyện',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
