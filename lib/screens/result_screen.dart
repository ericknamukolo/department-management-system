import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/widgets/student_result_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentsData = Provider.of<Students>(context)
        .students
        .where((stud) => stud.accStatus == true)
        .toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text('Student results', style: kTitleTextStyle),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => StudentResultCard(
                fname: studentsData[index].firstName,
                lname: studentsData[index].lastName,
              ),
              itemCount: studentsData.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
