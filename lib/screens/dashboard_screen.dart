// ignore_for_file: sized_box_for_whitespace

import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/notifications.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/widgets/dash_card.dart';
import 'package:department_management/widgets/pending_student_card.dart';
import 'package:department_management/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Students>(context, listen: false).fetchAndSetStudents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pendingStudentsData = Provider.of<Students>(context)
        .students
        .where((stud) => stud.accStatus == false)
        .toList();
    final allStudents = Provider.of<Students>(context).students;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashCard(
                text: 'Registered Students',
                data: Provider.of<Students>(context)
                    .students
                    .where((stud) => stud.accStatus == true)
                    .length,
                icon: Icons.account_circle_rounded,
              ),
              const DashCard(
                  text: 'Staff', data: 18, icon: Icons.class__rounded),
              DashCard(
                text: 'Pending Acc Activation',
                data: pendingStudentsData.length,
                icon: Icons.pending,
              ),
              DashCard(
                text: 'Notices',
                data: Provider.of<Notifications>(context, listen: false)
                    .newNotifications
                    .length,
                icon: Icons.warning_rounded,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'All Students',
                              style: kTitleTextStyle,
                            ),
                            Text(
                              'See All',
                              style: kSubTitleTextStyleWhite.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) => StudentCard(
                              address: allStudents[index].address,
                              course: allStudents[index].course,
                              email: allStudents[index].email,
                              fname: allStudents[index].firstName,
                              lname: allStudents[index].lastName,
                              nationality: allStudents[index].nationality,
                              phoneNumber: allStudents[index].phoneNumber,
                              accStatus: allStudents[index].accStatus,
                            ),
                            itemCount: allStudents.length,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                color: Color(0xff8692A1),
                endIndent: 40,
                indent: 40,
                thickness: 4,
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Pending Activation',
                        style: kTitleTextStyle,
                      ),
                      Container(
                        height: 480,
                        child: pendingStudentsData.isEmpty
                            ? const Center(
                                child: Text(
                                  'There are no pending accounts',
                                  textAlign: TextAlign.center,
                                  style: kBodyTextStyle,
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) =>
                                    PendingStudentCard(
                                  fname: pendingStudentsData[index].firstName,
                                  lname: pendingStudentsData[index].lastName,
                                  address: pendingStudentsData[index].address,
                                  age: pendingStudentsData[index].age,
                                  bloodGroup:
                                      pendingStudentsData[index].bloodGroup,
                                  course: pendingStudentsData[index].course,
                                  dob: pendingStudentsData[index].dob,
                                  email: pendingStudentsData[index].email,
                                  gender: pendingStudentsData[index].gender,
                                  nationality:
                                      pendingStudentsData[index].nationality,
                                  phoneNumber:
                                      pendingStudentsData[index].phoneNumber,
                                  salutation:
                                      pendingStudentsData[index].salutation,
                                  password: pendingStudentsData[index].password,
                                ),
                                shrinkWrap: true,
                                itemCount: pendingStudentsData.length,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
