import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController data;
  const InputField({Key? key, required this.hint, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: data,
      style: kBodyTextStyle,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: kHintTextStyle,
        border: InputBorder.none,
      ),
    );
  }
}
