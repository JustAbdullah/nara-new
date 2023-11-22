import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/appcolors.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/images_path.dart';
import '../widgets/textfiled/textformfiled_cut.dart';

class EditThePassword extends StatelessWidget {
  const EditThePassword({super.key});

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
                          "عزيزي المستخدم -${controller.theNameCheck.value}",
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
                    padding: EdgeInsets.only(top: screenHeight * 0.27),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.13),
                        child: Text(
                          "رجاءًا قم بإدخال كلمة المرور الجديدة",
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
                              keyboardType: TextInputType.name,
                              autofillHints: [AutofillHints.name],
                              obscureText: false,
                              controllerData: controller.newPassword,
                              value: (value) {
                                controller.thePasswordNew = value.toString();

                                SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: []);
                                return null;
                              },
                              onChanged: (val) {
                                controller.thePasswordNew = val.toString();

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
                              hintData: "كلمة المرور الجديدة".tr,
                              iconData: Icons.phone_android,
                              labelData: "كلمة المرور الجديدة".tr,
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
                                  controller.changeThePassword(
                                      controller.theIdCheck.value.toString(),
                                      controller.thePasswordNew.toString());
                                },
                                child: Container(
                                  width: screenWidth * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Text(
                                    "الحفظ الان",
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
                      visible: controller.loadingThenewPassword.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.loadingThenewPassword.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.loadingThenewPassword.value,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "أنتظر قليلاً يتم تغيير كلمة المرور وحفظها".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ))),
                  Visibility(
                      visible: controller.loadingThenewPassword.value,
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
