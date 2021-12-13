import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/notifications.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Students>(context, listen: false).fetchAndSetStudents();
      await Provider.of<Notifications>(context, listen: false)
          .fetchAndSetNotifications();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/loading.json',
              // fit: BoxFit.cover,
            ),
            const Text(
              'Loading',
              style: kBodyTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
