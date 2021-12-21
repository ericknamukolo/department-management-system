import 'package:bot_toast/bot_toast.dart';
import 'package:department_management/providers/notifications.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/screens/home.dart';
import 'package:department_management/screens/loading_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const DepartmentManagement()
  );
}

class DepartmentManagement extends StatelessWidget {
  const DepartmentManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Notifications(),
        ),
        ChangeNotifierProvider(
          create: (context) => Students(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
