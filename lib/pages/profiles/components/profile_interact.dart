import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_social_network/models/person_model.dart';

class ProfileInteract extends StatefulWidget {
  const ProfileInteract({super.key});

  @override
  State<ProfileInteract> createState() => _ProfileInteractState();
}

class _ProfileInteractState extends State<ProfileInteract> {
  final LocalStorage storage = LocalStorage('pet_app');
  late User userInfo;

  @override
  void initState() {
    userInfo = User.fromJson(storage.getItem("userInfo"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9FAFF),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Fans',
                style: TextStyle(fontSize: 20),
              ),
              Text(userInfo.fanCount.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Column(
            children: [
              const Text(
                'Followed',
                style: TextStyle(fontSize: 20),
              ),
              Text(userInfo.followerCount.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Column(
            children: [
              const Text(
                'Posts',
                style: TextStyle(fontSize: 20),
              ),
              Text(userInfo.postCount.toString(),
                  style: const TextStyle(
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
