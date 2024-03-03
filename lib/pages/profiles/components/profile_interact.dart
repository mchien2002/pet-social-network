import 'package:flutter/material.dart';

class ProfileInteract extends StatefulWidget {
  const ProfileInteract({super.key});

  @override
  State<ProfileInteract> createState() => _ProfileInteractState();
}

class _ProfileInteractState extends State<ProfileInteract> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9FAFF),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Fans',
                style: TextStyle(fontSize: 20),
              ),
              Text('3',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Column(
            children: [
              Text(
                'Followed',
                style: TextStyle(fontSize: 20),
              ),
              Text('5',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Column(
            children: [
              Text(
                'Posts',
                style: TextStyle(fontSize: 20),
              ),
              Text('20',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
