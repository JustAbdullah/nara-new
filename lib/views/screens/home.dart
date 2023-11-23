import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/constant/appcolors.dart';
import 'package:nara_test/views/screens/brands.dart';
import 'package:nara_test/views/screens/celebrities.dart';
import 'package:nara_test/views/screens/the_types.dart';

import '../../controllers/home_controller.dart';
import '../widgets/home_widgets/view_widget_brands_home/view_brands_home.dart';
import '../widgets/home_widgets/view_widget_products_home/details_products_widget.dart';
import '../widgets/icon_manage_widget/icon_manage_widget.dart';
import '../widgets/menu/menu.dart';
import '../widgets/home_widgets/pageview_home/pageview_home.dart';
import '../widgets/home_widgets/topheader/topheader.dart';
import '../widgets/home_widgets/view_widget_theceleb_home/view.dart';
import '../widgets/home_widgets/view_widget_products_home/view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        backgroundColor: AppColors.theMainColor,
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.15),
              child: ListView(children: [
                Column(children: [
                  TopHeader(),
                  PageViewHome(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "88".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () async {
                            Get.to(Celebrities());
                          },
                          child: Text(
                            "89".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.yellow,
                                fontSize: screenWidth * 0.050,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.39, child: ViewWidget()),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  PageViewHome(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "90".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () async {
                            Get.to(TheTypes());
                          },
                          child: Text(
                            "91".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.yellow,
                                fontSize: screenWidth * 0.050,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(height: screenHeight * 0.99, child: ViewTheWidget()),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  PageViewHome(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "92".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.balckgray,
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                            onTap: () async {
                              Get.to(Brands());
                            },
                            child: Text(
                              "93".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.yellow,
                                  fontSize: screenWidth * 0.050,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(
                      height: screenHeight * 0.42, child: VeiwHomeBrands()),
                ]),
              ]),
            ),

////////////////////////

            ////////////
            Menu(),
            ////////////////////////////////////////////////NavDown/////////

            DetailsProducts(),
          ],
        )));
  }
}
