// ignore_for_file: sized_box_for_whitespace

import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function() click;
  const NavButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.click,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.click,
        child: Container(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Icon(
                widget.icon,
                color: _isHovered ? kPrimaryColor : const Color(0xff8692A1),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.text,
                style: kBodyTextStyle.copyWith(
                    color:
                        _isHovered ? kPrimaryColor : const Color(0xff8692A1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
