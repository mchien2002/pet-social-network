import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldDate extends StatefulWidget {
  const TextFieldDate({super.key});

  @override
  State<TextFieldDate> createState() => _TextFieldDateState();
}

class _TextFieldDateState extends State<TextFieldDate> {
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _date,
        readOnly: true, //  it stops the text field from accepting a value
        decoration: const InputDecoration(
          labelText: 'Sinh nhật',
          labelStyle: TextStyle(
            color: Color(0xff707070),
          ),
          suffixIcon: Icon(Icons.calendar_month_sharp),
          border: InputBorder.none,
        ),
        onTap: () async {
          DateTime? pickDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickDate != null) {
            String formatDate = DateFormat('yyyy-MM-dd').format(pickDate);
            setState(() {
              _date.text = formatDate.toString();
            });
          }
        });
  }
}
