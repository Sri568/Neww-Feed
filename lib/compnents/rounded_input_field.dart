import 'package:flutter/material.dart';
import 'package:newsfeed/compnents/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;

  final ValueChanged<String> onChanged;

  const RoundedInputField(
      {Key? key, required this.hintText, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.blue.shade500,
        decoration: InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
        ),
        )
    );
  }
}
