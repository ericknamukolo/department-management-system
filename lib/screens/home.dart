import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/screens/dashboard_screen.dart';
import 'package:department_management/screens/notice_screen.dart';
import 'package:department_management/screens/result_screen.dart';
import 'package:department_management/screens/students_screen.dart';
import 'package:department_management/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final firstName = Provider.of<Students>(context, listen: false).firstname;
    final lastname = Provider.of<Students>(context, listen: false).lastname;
    int pageIndex = 0;
    final PageController _pageController =
        PageController(initialPage: pageIndex);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          children: [
            SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 30),
                    child: Text(
                      'Department Management',
                      textAlign: TextAlign.center,
                      style: kTitleTextStyle.copyWith(fontSize: 30),
                    ),
                  ),
                  const Icon(
                    Icons.verified_user_rounded,
                    size: 80,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$firstName $lastname',
                    style: kBodyTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  const SizedBox(height: 10),
                  NavButton(
                    icon: Icons.dashboard_rounded,
                    text: 'Dashboard',
                    click: () {
                      _pageController.jumpToPage(
                        0,
                      );
                    },
                  ),
                  NavButton(
                    icon: Icons.warning_rounded,
                    text: 'Notices',
                    click: () {
                      _pageController.jumpToPage(
                        1,
                      );
                    },
                  ),
                  NavButton(
                    icon: Icons.book_rounded,
                    text: 'Results',
                    click: () {
                      _pageController.jumpToPage(
                        2,
                      );
                    },
                  ),
                  NavButton(
                    icon: Icons.supervised_user_circle_rounded,
                    text: 'Students',
                    click: () {
                      _pageController.jumpToPage(
                        3,
                      );
                    },
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Color(0xff8692A1),
              endIndent: 40,
              indent: 40,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: const [
                  DashboardScreen(),
                  NoticeScreen(),
                  ResultScreen(),
                  StudentsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
