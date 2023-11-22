import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';

import '../../controllers/loading_controller.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingController loginController = Get.put(LoadingController());

    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    loginController.WhereISGogin();
    return Scaffold(
        backgroundColor: AppColors.WelcomeRed,
        body: SafeArea(
            child: Image.asset(
          "${ImagesPath.loadingTheApp}",
          fit: BoxFit.cover,
          width: screenWidth,
          height: screenHeight,
        )));
  }
}
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          /*(children: [
            Align(
                alignment: Alignment.center,
                child: Lottie.asset(
                  "${ImagesPath.logoLoading}",
                  width: screenWidth * 0.70,
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.32),
                child: Text(
                  "2".tr,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.white,
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                child: Text(
                  "1".tr,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.white,
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
        ));
  }
}
*/