import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  final String text;
  final int data;
  final IconData icon;
  const DashCard({
    Key? key,
    required this.text,
    required this.data,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 100,
      width: 230,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(.8),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.16),
            blurRadius: 6.0,
            offset: const Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.toString(),
                style: kBodyTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                width: 120,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: kBodyTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}
