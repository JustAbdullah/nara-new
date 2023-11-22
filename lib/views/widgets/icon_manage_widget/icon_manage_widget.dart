import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/constant/appcolors.dart';

import '../../../controllers/home_controller.dart';
import '../../screens/manage_the_products_user.dart';

class IconTheManageWidget extends StatelessWidget {
  const IconTheManageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.isHaveRightAccess.value == 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: screenHeight * 0.1, right: screenWidth * 0.6),
                  child: InkWell(
                    onTap: () {
                      Get.to(ManageTheProductsByTheUser());
                    },
                    child: Container(
                        height: screenHeight / 15,
                        decoration: BoxDecoration(
                          color: AppColors.WelcomeWhiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                height: screenHeight * 0.0012,
                                fontFamily: 'Cairo',
                                color: Colors.green,
                                fontSize: screenWidth * 0.220,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  )),
            )));
  }
}
