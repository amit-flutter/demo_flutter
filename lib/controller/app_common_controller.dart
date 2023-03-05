import 'package:demo_flutter/model/login/LoginResponse.dart';
import 'package:get/get.dart';

class AppCommonController extends GetxController {
  RxString currentImagePath = "".obs;
  Rx<LoginResponse> currentUser = LoginResponse().obs;
  RxList leadData = [].obs;

  sortLeadDataByFormatDate() {
    print("Starting Sort");
    for (int i = 0; i < leadData.length; i++) {
      // leadData[i]['followDate'] = DateTime.parse(leadData[i]['followDate']).toString();
      leadData[i]['followDate'].sort((a, b) {
        return a.compareTo(b);
      });
    }

    print(DateTime.parse('2020-01-02'));
  }
}
