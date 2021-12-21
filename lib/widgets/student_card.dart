import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String fname;
  final String lname;
  final String phoneNumber;
  final String email;
  final String nationality;
  final String address;
  final String course;
  final bool accStatus;
  final String id;
  const StudentCard({
    Key? key,
    required this.address,
    required this.fname,
    required this.lname,
    required this.phoneNumber,
    required this.email,
    required this.nationality,
    required this.course,
    required this.accStatus,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 6.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const Icon(
          //   Icons.account_circle_rounded,
          //   color: kSecondaryColor,
          //   size: 40,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  width: 120,
                  child: Text(
                    '$fname $lname',
                    style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 120,
                  alignment: Alignment.center,
                  child: Text(
                    email,
                    style: kHintTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 14,
                  color: accStatus ? Colors.green : Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  accStatus ? 'Active' : 'Inactive',
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),

          Flexible(
            child: Container(
              width: 120,
              alignment: Alignment.centerRight,
              child: Text(
                course,
                style: kBodyTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 120,
              alignment: Alignment.centerRight,
              child: Text(
                phoneNumber,
                style: kBodyTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 120,
              alignment: Alignment.centerRight,
              child: Text(
                address,
                style: kBodyTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 100,
              alignment: Alignment.centerRight,
              child: Text(
                nationality,
                style: kBodyTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
