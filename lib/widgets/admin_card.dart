import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  const AdminCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.16),
            blurRadius: 6.0,
            offset: const Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/pic.jpg'), fit: BoxFit.cover),
            ),
          ),
          Text(
            'Mr Sivubwa',
            style: kTitleTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.normal),
          ),
          Text(
            'HOD',
            style: kBodyTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
