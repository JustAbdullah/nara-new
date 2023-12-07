import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/images_path.dart';
import 'package:nara_test/views/screens/home.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../widgets/manage_the_products/add_products.dart';
import '../widgets/manage_the_products/manage_options.dart';
import '../widgets/manage_the_products/show_my_orders.dart';

class ManageTheProductsByTheUser extends StatelessWidget {
  const ManageTheProductsByTheUser({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: Column(
                      children: [
                        Text(
                          "149".tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.balckgray,
                            fontSize: screenWidth * 0.052,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Lottie.asset("${ImagesPath.isNewOptions}",
                            width: screenWidth * 0.32),
                        Text(
                          "150".tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.balckgray,
                            fontSize: screenWidth * 0.047,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "151".tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.balckgray,
                            fontSize: screenWidth * 0.037,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        Container(
                          height: screenHeight / 18,
                          width: screenWidth * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "152".tr,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.white,
                                fontSize: screenWidth * 0.049,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                homeController.ManageThePageProductsUers.value =
                                    true;
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    "${ImagesPath.manageTheProducts}",
                                    width: screenWidth * 0.2,
                                  ),
                                  Text(
                                    "153".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.balckgray,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.07,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.showTheAddPage.value = true;
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    "${ImagesPath.addNew}",
                                    width: screenWidth * 0.2,
                                  ),
                                  Text(
                                    "154".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.balckgray,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                homeController.showTheMyOrdersByUSers.value =
                                    true;
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    "${ImagesPath.iconOrder}",
                                    width: screenWidth * 0.2,
                                  ),
                                  Text(
                                    "طلبيات منتجاتي".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.balckgray,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          "155".tr,
                          style: TextStyle(
                            height: screenHeight * 0.0017,
                            fontFamily: 'Cairo',
                            color: AppColors.WelcomeRed,
                            fontSize: screenWidth * 0.037,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(Home());
                          },
                          child: Container(
                            height: screenHeight / 18,
                            width: screenWidth * 0.45,
                            decoration: BoxDecoration(
                                color: AppColors.WelcomeRed,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "156".tr,
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.white,
                                  fontSize: screenWidth * 0.049,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          AddTheProducts(),
          ManageOptions(),
          ShowMyOrdersUserd()
        ],
      )),
    );
  }
}
