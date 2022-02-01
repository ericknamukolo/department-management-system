import 'package:department_management/models/student.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? token;
String? otp;

class Students with ChangeNotifier {
  var firstname;
  var lastname;
  List<Student> _students = [];
  List<Student> get students {
    return [..._students];
  }

  Future<void> fetchAndSetStudents() async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/admin/allStudents';

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var data = json.decode(response.body);
    List<Student> loadedStudents = [];
    if (data == null) {
      return;
    }
    data['data'].forEach(
      (student) => {
        loadedStudents.add(
          Student(
            firstName: student['first_name'],
            lastName: student['last_name'],
            address: student['address'],
            age: student['age'],
            bloodGroup: student['blood_group'],
            dob: student['date_of_birth'],
            course: student['course'],
            email: student['email'],
            gender: student['first_name'],
            nationality: student['nationality'],
            password: student['password'],
            phoneNumber: student['mobile'],
            salutation: student['salutation'],
            accStatus: student['account_state'],
          ),
        ),
      },
    );
    _students = loadedStudents;
    notifyListeners();
  }

  Future<void> activateAcc(String email, String phone, String studentID) async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/admin/activate';
    var response = await http.put(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(
        {
          "email": email,
          "mobile": phone,
          "studentId": studentID,
        },
      ),
    );
    print(response.body);
    notifyListeners();
  }

  Future<void> adminAuth(String email, String password) async {
    // Future<void> adminAuth() async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/admin/login';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      token = data['token'];
      otp = data['otp'];
      // firstname = data['data']['firstName'];
      // lastname = data['data']['lastName'];
    } else {
      throw Exception('Email or Password is incorrect');
    }

    notifyListeners();
  }

  Future<void> sendOtp(String userOtp) async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/admin/admin-otp';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(
        {
          "otp": userOtp,
        },
      ),
    );
    var data = json.decode(response.body);
    print(data);
    if (data['sucesse'] == true) {
      token = data['token'];
      firstname = data['data']['firstName'];
      lastname = data['data']['lastName'];
    } else {
      throw Exception('incorrect pin');
    }
  }
}
