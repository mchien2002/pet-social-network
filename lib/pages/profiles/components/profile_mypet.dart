import 'package:flutter/material.dart';
import 'package:pet_social_network/pages/profiles/components/profile_connect.dart';

class ProfileMypet extends StatelessWidget {
  const ProfileMypet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffC4C4C4),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Pets',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              const CircleAvatar(
                minRadius: 30,
                backgroundImage: AssetImage('assets/images/avatar2.png'),
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileConnect()),
                  );
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffC4C4C4),
                    border: Border.all(
                      color: Colors.black, //color of border
                      width: 1, //width of border
                    ),
                  ),
                  child: const ImageIcon(
                    AssetImage('assets/images/subtract2.png'),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
