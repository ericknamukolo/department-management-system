import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/screens/home.dart';
import 'package:department_management/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final String adminName;
  final String title;
  const AdminCard({
    Key? key,
    required this.adminName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (event) {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => LoadingScreen()));
      // },
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        height: 200,
        width: 180,
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
            const Icon(
              Icons.verified_user_rounded,
              size: 90,
              color: kPrimaryColor,
            ),
            Text(
              adminName,
              style: kTitleTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: kBodyTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
