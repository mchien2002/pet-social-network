import 'dart:io';
import 'package:flutter/material.dart';

class ItemPicker extends StatefulWidget {
  final File imageFile;
  const ItemPicker({super.key, required this.imageFile});
  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: FileImage(widget.imageFile), fit: BoxFit.cover),
      ),
    );
  }
}
