import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:nara_test/controllers/home_controller.dart';
import 'package:nara_test/core/constant/appcolors.dart';
import 'package:nara_test/core/constant/images_path.dart';
import 'package:nara_test/views/screens/auth_welcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 249, 249),
      body: Stack(children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.235),
                child: Text(
                  "2".tr,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.balckgray,
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ))),
        Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.185),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "${ImagesPath.naraTheLogo}",
                width: (screenWidth * 0.9),
                height: (screenHeight * 0.67),
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.645),
                child: Column(
                    children: AnimateList(
                  interval: 1500.ms,
                  effects: [FadeEffect(duration: 2000.ms)],
                  children: [
                    Text(
                      "4".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.WelcomeRed,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "5".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.balckgrayOne,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "6".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.balckgrayOne,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "7".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.balckgrayOne,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )))),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.75),
            child: InkWell(
              onTap: () {
                homeController.LogInAuth.value = true;
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.WelcomeRed,
                    borderRadius: BorderRadius.circular(10)),
                width: screenWidth * 0.6,
                height: screenHeight / 20,
                child: Center(
                    child: Text(
                  "9".tr,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ),
        AuthWelcome()
      ]),
    ));
  }
}
