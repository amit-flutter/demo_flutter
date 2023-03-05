import 'package:demo_flutter/model/login/LoginResponse.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppCommonController extends GetxController {
  RxString currentImagePath = "".obs;
  Rx<LoginResponse> currentUser = LoginResponse().obs;
  RxList leadData = [].obs;
  RxList tempLeadData = [].obs;
  RxInt leadCount = 0.obs;
  RxBool isSort = false.obs;

  sortLeadDataByFormatDate() {
    isSort.value = true;
    for (int i = 0; i < leadData.length; i++) {
      leadData[i]['followDate'] = DateFormat("yyyy-MM-dd").format(DateTime.parse(leadData[i]['followDate'].toString()));
      leadData.sort((a, b) {
        return a['followDate'].compareTo(b['followDate']);
      });
    }
    print(leadData);
  }

  resetLeadData() {
    isSort.value = false;
    for (int i = 0; i < leadData.length; i++) {
      leadData.sort((a, b) {
        return a['customer_id'].compareTo(b['customer_id']);
      });
    }
  }
}
