import 'package:bot_toast/bot_toast.dart';
import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/widgets/activation_info.dart';
import 'package:flutter/material.dart';

class PendingStudentCard extends StatelessWidget {
  final String fname;
  final String lname;
  final String phoneNumber;
  final String email;
  final String dob;
  final int age;
  final String gender;
  final String salutation;
  final String bloodGroup;
  final String nationality;
  final String address;
  final String course;
  final String password;
  const PendingStudentCard({
    Key? key,
    required this.fname,
    required this.lname,
    required this.address,
    required this.age,
    required this.bloodGroup,
    required this.dob,
    required this.course,
    required this.email,
    required this.gender,
    required this.nationality,
    required this.phoneNumber,
    required this.salutation,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
        children: [
          const Icon(
            Icons.account_circle_rounded,
            size: 40,
            color: kSecondaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$salutation. $fname $lname',
                style: kBodyTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Reject'),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).errorColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ActivationInfo(
                          password: password,
                        ),
                      );
                    },
                    child: const Text('Activate'),
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
