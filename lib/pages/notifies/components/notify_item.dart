import 'package:flutter/material.dart';

class NotifyItem extends StatefulWidget {
  final String img;
  final String name;
  final String time;
  final bool gender;
  final bool add;
  const NotifyItem({
    super.key,
    required this.img,
    required this.name,
    required this.time,
    required this.gender,
    required this.add,
  });

  @override
  State<NotifyItem> createState() => _NotifyItemState();
}

class _NotifyItemState extends State<NotifyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      padding: const EdgeInsets.all(8),
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.img),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: widget.gender
                                  ? const Color(0xff4890FB)
                                  : const Color(0xffFC508E)),
                        ),
                        const TextSpan(text: ' đã thích trạng thái của bạn.'),
                      ]),
                ),
                Row(children: [
                  Text(widget.time),
                  // o day
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    children: [
                      if (widget.add)
                        Container(
                          width: 59,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffC4C4C4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Từ chối',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      if (widget.add)
                        Container(
                          width: 59,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffFC508E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Đồng ý',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
