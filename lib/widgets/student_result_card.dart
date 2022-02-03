import 'package:department_management/constants/text_constants.dart';
import 'package:flutter/material.dart';

class StudentResultCard extends StatelessWidget {
  final String fname;
  final String lname;
  const StudentResultCard({
    Key? key,
    required this.fname,
    required this.lname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //  height: 80,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$fname $lname',
            style: kBodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Software Engineering',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Java Programmming',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Financial Accounting',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Professional Ethics',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'IPTR',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'DBMS Laboratory',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'B',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'A+',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'C',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'B',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'B+',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            indent: 900.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '4.2 GPA',
              style: kBodyTextStyle.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
