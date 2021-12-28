import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  const InputField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kBodyTextStyle.copyWith(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: kHintTextStyle,
        fillColor: const Color(0xff25262a),
        border: InputBorder.none,
      ),
    );
  }
}
