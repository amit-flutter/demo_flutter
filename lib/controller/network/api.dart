// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:http/http.dart' as http;

class FormData {
  final String firstname;
  final String lastname;
  final String email;
  final String country;
  final double mobile;
  final String password;

  FormData(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.country,
      required this.mobile,
      required this.password});
  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        country: json['country'],
        mobile: json['mobile'],
        password: json['password']);
  }
}

// class GetDataProcess {
//   Future<List<FormData>> getData() async {
//     String url = 'https://vibrobike.solutiontrackers.biz/api/signUpDemo';
//     final response = await http.get(Uri.parse(url));
//     var responseData = json.decode(response.body);
//     List<FormData> data = [];
//     for (var singleUser in responseData) {
//       FormData formData = FormData(
//           firstname: singleUser[""],
//           lastname: singleUser[""],
//           email: singleUser[""],
//           country: singleUser[""],
//           mobile: singleUser[""],
//           password: singleUser[""]);
//
//       //Adding user to the list.
//       data.add(formData);
//     }
//     return data;
//   }
// }

class PostDataProcess {
  Future<String> sendData(
      String firstname, String lastname, String email, String country, String mobile, String password) async {
    print('Reached');
    try {
      final response = await http.post(
        Uri.parse('https://vibrobike.solutiontrackers.biz/api/signUpDemo'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(<String, String>{
          ' firstname': firstname,
          'lastname': lastname,
          'email': email,
          'country': country,
          'mobile': mobile,
          'password': password
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        // return FormData.fromJson(jsonDecode(response.body));
        return StringConst.kSuccess;
      } else {
        return response.body;
      }
    } catch (e) {
      return '$e';
    }
  }
}
