import 'package:flutter/material.dart';
import 'package:pet_social_network/constanst.dart';
import 'package:pet_social_network/pages/zoos/components/zoo_each_item.dart';

class ZooItem extends StatelessWidget {
  final String img;
  final String txt;
  final String name;
  final String avatar;
  const ZooItem(
      {super.key,
      required this.img,
      required this.txt,
      required this.name,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ZooEachItem(
            img: img,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffC4C4C4), width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: Image.network(
                '$BASE_URL_IMAGE/images/$img',
                fit: BoxFit.cover,
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 6),
                            child: Text(
                              txt,
                              style: const TextStyle(
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 28,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('$BASE_URL_IMAGE/icons/$avatar'),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            child: const Row(
                              children: [
                                Icon(
                                  size: 20,
                                  Icons.favorite_sharp,
                                  color: Color(0xffFC508E),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xffC4C4C4),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
