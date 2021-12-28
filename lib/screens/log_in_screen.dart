import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/widgets/admin_card.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.blue),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 180, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Login As...', style: kBodyTextStyle),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            AdminCard(),
                            AdminCard(),
                            AdminCard(),
                          ],
                        ),
                      ],
                    ),
                    Container(child: Text('login fields')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

        // ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       primary: kSecondaryColor,
        //                     ),
        //                     child: const Padding(
        //                       padding: EdgeInsets.symmetric(
        //                           horizontal: 20, vertical: 10),
        //                       child: Text('Login to System'),
        //                     ),
        //                   ),