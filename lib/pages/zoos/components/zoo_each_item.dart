import 'package:flutter/material.dart';

class ZooEachItem extends StatefulWidget {
  final String img;
  const ZooEachItem({super.key, required this.img});

  @override
  State<ZooEachItem> createState() => _ZooEachItemState();
}

class _ZooEachItemState extends State<ZooEachItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Vườn thú cưng',
          style: TextStyle(
            color: Color(0xff4890FB),
            fontSize: 36,
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 0.5,
                )),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/avatar1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trần Trà My',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '2021-06-06 21:32:03',
                      style: TextStyle(
                        color: Color(0xff958F8F),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  height: 36,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff4890FB),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Theo dõi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.yellow,
              margin: EdgeInsets.only(top: 8),
              child: Image.asset(
                widget.img,
                fit: BoxFit.cover,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: Color(0xff707070),
                  size: 30,
                ),
                SizedBox(
                  width: 28,
                ),
                Icon(
                  Icons.message_sharp,
                  color: Color(0xff707070),
                  size: 30,
                ),
                SizedBox(
                  width: 16,
                ),
                ImageIcon(
                  AssetImage('assets/images/share.png'),
                  color: Color(0xff707070),
                  size: 44,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Misa đáng iu quá trời ^^',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 10),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
