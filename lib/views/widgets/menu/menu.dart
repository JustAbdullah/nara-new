import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/views/screens/brands.dart';

import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../screens/celebrities.dart';
import '../../screens/home.dart';
import '../../screens/showAccount.dart';
import '../../screens/the_types.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: Container(
          width: screenWidth,
          height: screenHeight / 14,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Get.to(Home());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "${ImagesPath.homeIcon}",
                          width: screenWidth * 0.07,
                        ),
                        Text(
                          "47".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Celebrities());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${ImagesPath.TheCelebsIcon}",
                        width: screenWidth * 0.07,
                      ),
                      Text(
                        "46".tr,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.balckgray,
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                InkWell(
                    onTap: () {
                      Get.to(Brands());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "${ImagesPath.TheBransIcon}",
                          width: screenWidth * 0.07,
                        ),
                        Text(
                          "45".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.to(TheTypes());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${ImagesPath.TheTypeIcon}",
                        width: screenWidth * 0.07,
                      ),
                      Text(
                        "44".tr,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.balckgray,
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.to(showMyAccount());
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "${ImagesPath.TheCartIcon}",
                          width: screenWidth * 0.07,
                        ),
                        Text(
                          "43".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
