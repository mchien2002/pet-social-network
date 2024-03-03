import 'package:flutter/material.dart';

class TextFieldSelect extends StatefulWidget {
  final List<DropdownMenuItem<String>> menuItems;
  final String labelText;
  final String selectedValue;
  const TextFieldSelect(
      {super.key,
      required this.menuItems,
      required this.labelText,
      required this.selectedValue});

  @override
  State<TextFieldSelect> createState() => _TextFieldSelectState();
}

class _TextFieldSelectState extends State<TextFieldSelect> {
  String selectedValue = "Nam";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Color(0xff707070),
        ),
        border: InputBorder.none,
        labelText: widget.labelText,
      ),
      value: widget.selectedValue,
      items: widget.menuItems,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }
}
