import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/students.dart';
import 'package:department_management/screens/loading_screen.dart';
import 'package:department_management/widgets/admin_card.dart';
import 'package:department_management/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _otp = TextEditingController();
  bool _isLoading = false;
  bool _showOtpField = false;
  void login() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Students>(context, listen: false)
          .adminAuth(_email.text, _password.text);

      //  await Provider.of<Students>(context, listen: false).adminAuth();
      setState(() {
        _showOtpField = true;
      });
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Phone number or password is incorrect',
            style: kBodyTextStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void sendOtp() async {
    try {
      setState(() {
        _isLoading = true;
      });
      print(_otp.text);
      await Provider.of<Students>(context, listen: false).sendOtp(_otp.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Incorrect OTP!',
            style: kBodyTextStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 180),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    child: Text(
                      'Department Management System',
                      style: kTitleTextStyleWhite.copyWith(fontSize: 40),
                    ),
                  ),
                  // Lottie.asset(
                  //   'assets/school.json',
                  //   alignment: Alignment.bottomCenter,
                  // ),
                  Lottie.asset(
                    'assets/globe.json',
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
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
                            AdminCard(
                              adminName: 'Mr Patrick Mwewa',
                              title: 'HOD',
                            ),
                            AdminCard(
                              adminName: 'Mr Mupela Nsowa',
                              title: 'Admin',
                            ),
                            AdminCard(
                              adminName: 'Ms Kangwa Musonda',
                              title: 'Admin',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 400,
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 6.0,
                            offset: const Offset(0.0, 3.0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Login to your account',
                              style: kTitleTextStyle),
                          const SizedBox(height: 10),
                          Text(
                            _showOtpField
                                ? 'Enter the otp that has been sent to your phone number'
                                : 'login to the admin panel and manage the student data',
                            style: kBodyTextStyle,
                          ),
                          const SizedBox(height: 20),
                          _showOtpField
                              ? InputField(
                                  hint: 'Otp number',
                                  data: _otp,
                                )
                              : Column(
                                  children: [
                                    InputField(
                                      hint: 'Email',
                                      data: _email,
                                    ),
                                    const SizedBox(height: 10),
                                    InputField(
                                      hint: 'Password',
                                      data: _password,
                                    ),
                                  ],
                                ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: _showOtpField ? sendOtp : login,
                              style: ElevatedButton.styleFrom(
                                primary: kSecondaryColor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10),
                                child: Text('Login'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _isLoading
                              ? const Center(
                                  child: SizedBox(
                                    child: CircularProgressIndicator(),
                                    height: 30,
                                    width: 30,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
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
