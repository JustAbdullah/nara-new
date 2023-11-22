import 'package:get/get.dart';

import '../core/services/appservices.dart';
import '../views/screens/home.dart';
import '../views/screens/welcome.dart';

class LoadingController extends GetxController {
  AppServices appServices = Get.find();

  RxBool isRealyGogin = false.obs;

  RxInt theWay = 0.obs;
  // AppServices appServices = Get.find();

  void WhereISGogin() async {
    await Future.delayed(Duration(seconds: 5), () async {
      if (isRealyGogin.value == false) {
        isRealyGogin.value = true;

        if (appServices.sharedPreferences.containsKey('TheWay')) {
          theWay.value = appServices.sharedPreferences.getInt('TheWay') as int;

          if (theWay.value == 1) {
            Get.to(Home());
          } else {
            Get.to(Welcome());
          }
        } else {
          Get.to(Welcome());
        }
      }
    });
  }
}
