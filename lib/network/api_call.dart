// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:demo_flutter/controller/app_common_controller.dart';
import 'package:demo_flutter/model/login/LoginResponse.dart';
import 'package:demo_flutter/network/api_details.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:get/get.dart';
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

class GetApiCall {
  AppCommonController appCommonController = Get.put(AppCommonController());

  Future getLeadData() async {
    final response = await http.get(Uri.parse("${ApiDetails.kBaseAPI}${ApiDetails.kGetLeadDataAPI}"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiDetails.kDemoToken}',
    });
    var responseData = json.decode(response.body);
    List lead = responseData['data']['lead'];
    appCommonController.leadData.value = lead;
    appCommonController.tempLeadData.value = lead;
    log("${lead.length}");
    log("${lead[2]}");
    // { customer_id: 1, cmp_id: 4, cmp_name: iboon, contact_name: KENA J RANA, designation: CA , mobile_no:
    // 9898989090, mobile_no2: , email: KENA@gmail.com, website: WWW.IBOON.CO.IN, address: Sola, Ahmedabad,
    // address2: , city: ahmedabad, state: GUJARAT, country: India, pincode: 380056, note: NO, status: 4,
    // promotion_id: 8, referral_id: 7, followDate: 2022-10-28, dob: null, doa: null, user_id: 4, assign_user_id:
    // null, product_id: 6, service_id: 6, created_by: practical, created_time_date: 2022-09-28 15:57:58,
    // updated_by: null, updated_time_date: 2022-09-28 03:57:56, delete_data: 1, app_user_id: null}
    return responseData;
  }

  Future getLeadCountData() async {
    final response = await http.get(Uri.parse("${ApiDetails.kBaseAPI}${ApiDetails.kGetLeadCountDataAPI}"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiDetails.kDemoToken}',
    });
    var responseData = json.decode(response.body);
    print(responseData);
    // {status: true, message: Lead Count Listed, data: {lead_count: 7}}
    int leadCount = responseData['data']['lead_count'];
    appCommonController.leadCount.value = leadCount;
    return leadCount;
  }
}

class PostApiCall {
  AppCommonController appCommonController = Get.put(AppCommonController());

  Future<String> login({required String email, required String password}) async {
    print('Calling Login API ========> ');
    try {
      final response = await http.post(
        Uri.parse("${ApiDetails.kBaseAPI}${ApiDetails.kLoginAPI}"),
        headers: <String, String>{
          "accept": 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email_or_mobile': email,
          'password': password,
          "device_id": "string",
          "device_type": "string",
          "fcm_token": "string"
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        LoginResponse currentUser = LoginResponse.fromJson(jsonDecode(response.body));
        appCommonController.currentUser.value = currentUser;
        return StringConst.kSuccess;
      } else {
        var errorMessage = json.decode(response.body);
        return errorMessage['message'];
      }
    } catch (e) {
      return '$e';
    }
  }
}

// practical.clumpcrm@gmail.com    / 1234
// 62bd92fefef8a3a6f83b436a43cb97e6675dbff75d5b5a0435ddf0f600f66b8e690f80e6d6bd9bd00a313af357c66b24a4550a729209f557764fead74196aa8b9IdvR3ggkk+aydrCeXkEEKOYN8QF5V0naLJg0MwZYrJDo2IKZMTVSfe0qrSr+jdZs39ZhTKK73Ljd7uq5gCFjohAmZ74rL2mC3VZng1L5rU4Ew6nkotawL5yLVXFgRa75tlAPiHxiGqF26YYZxCwg2Lqdpwl4fzD1QAtTMfZFGpeK+iXBT0+1rFFdLdnsH1EiXUg8E60Nzky1IABrUdFrOBwWsnDiOu+rx+s2Q/xY2bTbiaQE4CRfJBmYbUvI+T8i34l7eDNucbX4WssvmtuLRoWsWgh0kNVo4W6tJMlF9SxYxzCSk0EmFnkXTDLUpOYmLjkXt7ER1i2fk4Y1KF6+rnYxEFqY9f+K60sI++a1qQT+kxknuYFWVRaDvAEpJdj7Ja8HDj0WXLLm7M7dx+ORAJnqxC+uYdV/S99ugF4dY237j1d9H0N+gr/imsPmR6/PeH18SUB5ncQeBAjeFlRHd1tTye4vwqgNi/Pvv7Ns8Wxmme2PoBdwiBmQjZgVtH75mDHoQnCe7Pj3XyMkrsts0xQDa2XkN2F9rdNRxCcnsy3UhqwIdh4l+DSItp6vIbBDngP2nHJJcDkfe6K+/OJbwLfJj2c72r7z0GUlOWK6PA0g3bAUKuI1x/zqjgoKS9TSB3+ur+9uR9lFoTmVSuLOijqu7oPPKmFEJLC0W7RTjw1WAy941v4UeQoTqBr+0ItdhcCAcUz/2LmyB10h0mK05gsPNyKw2gQl1XHx535375iADlVXCywXACUt6nZhwIkgxcBT032Ur12Y/oxJPpOX5dOp9Uxx+4g8pWWxHT8HNyHZBrCCoh6JQSJzioj2KjixTmgcPmKwuIYqx+lzKecUfEbAUeZfKcAJHall0xFX2dKnQhlIMY0X+C8yemCW94gLSDLlNndHTULaNECnMOUiyeY6RX3kxlhNW9ed3gQwxDGQUDRh0RmLHrrQtstvo8vxQU84Ji8aUtgU+KW2CDzuhmLTjqu5QcEBaC8r10+XX8mDdPdNuLkostPPeIdG+NQrnCbK0uWmTzKZ1faDWAEPdJsEthi8mF30KmdLyXwuTiAMYlgKZdQ75IGBKapRHZbstmiQCNNXehZZ3i2ejpJCDaFNoSqFf+mxO07w5cgCaYlulFYvvQCXC+xqhUmOAFqRrbCM9maN6SvOKvIC6pimHZX3rL0iCKh+v1Fvn06+1ecW/DL5WEi4TyZvBpTCydPFtoRV0ovq0Z+QeawQAn8VJVjggQHHnfPfd6brxDFOms66HUHnTJlSImGgNbt2XyDniKGfq4JfwxIJI0REGxvldpdelDx98FHDE2gZsImTZ5xqHe/shC+LEpOm1WouEE4vxT328KC7K/1JZc45ws3b9wbXvkE2eBV9xg9IPLM9iGyysLkhhW3fvXd5kgpNoD1Ux/RxNPkXRCTSPOxRemnoccmMhLRL5LkF0KwnvQODwmoCFvLXmhBsQ1MnrGP16Qq
