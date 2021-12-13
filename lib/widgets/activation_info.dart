import 'package:bot_toast/bot_toast.dart';
import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/students.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivationInfo extends StatefulWidget {
  final String password;
  const ActivationInfo({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  State<ActivationInfo> createState() => _ActivationInfoState();
}

class _ActivationInfoState extends State<ActivationInfo> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final selectedStudent = Provider.of<Students>(context, listen: false)
        .students
        .firstWhere((stud) => stud.password == widget.password);
    final TextEditingController textEditingController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.16),
                blurRadius: 6.0,
                offset: const Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${selectedStudent.salutation}. ${selectedStudent.firstName} ${selectedStudent.lastName}',
                style: kBodyTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Programme : ${selectedStudent.course}',
                    style: kBodyTextStyle),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Phone Number : ${selectedStudent.phoneNumber}',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Email Address : ${selectedStudent.email}',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Age : ${selectedStudent.age}',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Blood Group : ${selectedStudent.bloodGroup}',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Nationality : ${selectedStudent.nationality}',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Physical Address : ${selectedStudent.address}',
                  style: kBodyTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'Assign Student ID',
                        hintStyle: kHintTextStyle,
                        labelStyle: kBodyTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _isLoading ? Colors.grey : kSecondaryColor,
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await Provider.of<Students>(context, listen: false)
                            .activateAcc(
                          selectedStudent.email,
                          selectedStudent.phoneNumber,
                          textEditingController.text,
                        );
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.of(context).pop();
                        await Provider.of<Students>(context, listen: false)
                            .fetchAndSetStudents();
                        BotToast.showText(
                          text:
                              '${selectedStudent.firstName}\'s Account has been activated successfully.',
                          duration: const Duration(seconds: 5),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: _isLoading
                            ? const Text('Activating...')
                            : const Text('Activate Account'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
