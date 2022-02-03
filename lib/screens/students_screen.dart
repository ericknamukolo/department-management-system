import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allStudents = Provider.of<Students>(context).students;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text('All Students', style: kTitleTextStyle),
          Expanded(
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
                id: allStudents[index].password,
              ),
              itemCount: allStudents.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
