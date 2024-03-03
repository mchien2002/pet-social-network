import 'package:flutter/material.dart';
import 'package:tutorialpage/pages/adds/components/add_update.dart';

class AddInfoUser extends StatefulWidget {
  const AddInfoUser({super.key});

  @override
  State<AddInfoUser> createState() => _AddInfoUserState();
}

class _AddInfoUserState extends State<AddInfoUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xffC4C4C4),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar3.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: const Text(
                  'Trần Trà My',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/sex.png'),
                    color: Color(0xffFC508E),
                  ),
                  Text('24 tuổi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      )),
                ],
              ),
              const Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/Pin_alt_duotone.png'),
                    color: Color(0xffFC508E),
                  ),
                  Text(
                    'Hà Nội',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddUpdate()));
              },
              icon: Image.asset('assets/images/pen.png'),
            ),
          ),
        ],
      ),
    );
  }
}
