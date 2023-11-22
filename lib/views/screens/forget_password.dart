import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/appcolors.dart';
import 'package:nara_test/views/screens/welcome.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/images_path.dart';
import '../../core/localization/changelanguage.dart';
import '../widgets/textfiled/textformfiled_cut.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.theMainColor,
              body: SafeArea(
                  child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            right: screenWidth * 0.02,
                            left: screenWidth * 0.02),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                Get.to(Welcome());
                              },
                              child: GetX<ChangeLanguageToLocale>(
                                builder: (scontroller) =>
                                    scontroller.changeLangData == 1
                                        ? Image.asset(
                                            "${ImagesPath.arrowIconRight}",
                                            width: screenWidth * 0.09,
                                          )
                                        : Image.asset(
                                            "${ImagesPath.arrowIconLeft}",
                                            width: screenWidth * 0.09,
                                          ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            right: screenWidth * 0.12,
                            left: screenWidth * 0.12),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                Get.to(Welcome());
                              },
                              child: Text(
                                "العودة لصفحة تسجيل الدخول".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color:
                                        const Color.fromARGB(255, 47, 47, 47),
                                    fontSize: screenWidth * 0.043,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "عملية إستعادة كلمة المرور",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.blackNumberFourBlackMode,
                            fontSize: screenWidth * 0.054,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.2),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.13),
                        child: Text(
                          "رجاءًا قم بإدخال رقم الهاتف الخاص بك عند قيامك بإنشاء حسابك",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.blackNumberFourBlackMode,
                              fontSize: screenWidth * 0.047,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.4),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: TextFormFiledCus(
                              keyboardType: TextInputType.number,
                              autofillHints: [AutofillHints.name],
                              obscureText: false,
                              controllerData: controller.phoneCheck,
                              value: (value) {
                                controller.thePhoneCheck = value.toString();

                                SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: []);
                                return null;
                              },
                              onChanged: (val) {
                                controller.thePhoneCheck = val.toString();

                                SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: []);
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "13".tr;
                                }
                                return value.length > 20 ? "13".tr : null;
                              },
                              hintData: "رقم الهاتف".tr,
                              iconData: Icons.phone_android,
                              labelData: "رقم الهاتف".tr,
                              fillColor: Colors.white,
                              iconColor: AppColors.blackNumberFourBlackMode,
                              hintColor: AppColors.theMainOfColor,
                              fontColor: AppColors.blackNumberFourBlackMode,
                              borderSideColor: Colors.white,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.4),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.3),
                              child: InkWell(
                                onTap: () {
                                  controller.checknumber(
                                      controller.thePhoneCheck.toString());
                                },
                                child: Container(
                                  width: screenWidth * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Text(
                                    "التحقق الان",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.white,
                                        fontSize: screenWidth * 0.047,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )))),
                  Visibility(
                      visible: controller.loadingTheCheck.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.loadingTheCheck.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.loadingTheCheck.value,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "انتظر قليلاً يتم التاكد من رقم الهاتف".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ))),
                  Visibility(
                      visible: controller.loadingTheCheck.value,
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.14),
                        child: Align(
                          alignment: Alignment.center,
                          child: Lottie.asset("${ImagesPath.loadingWait}",
                              width: screenWidth * 0.21),
                        ),
                      )),
                ],
              )),
            ));
  }
}
