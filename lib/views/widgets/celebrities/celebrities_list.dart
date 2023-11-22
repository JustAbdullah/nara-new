import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/views/widgets/celebrities/view_the_celeb.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';

class CelebritiesList extends StatelessWidget {
  const CelebritiesList({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.celebritiesTheList.value,
            child: Container(
                width: screenWidth,
                height: screenHeight,
                color: AppColors.offerColor,
                child: Stack(children: [
                  Padding(
                      padding: EdgeInsets.only(top: screenWidth * 0.07),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "قائمة المشاهير",
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.blackNumberFourBlackMode,
                                fontSize: screenWidth * 0.055,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: view_the_celeb(),
                    ),
                  )
                ]))));
  }
}
