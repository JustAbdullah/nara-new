import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/constant/images_path.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../widgets/icon_manage_widget/icon_manage_widget.dart';
import '../widgets/menu/menu.dart';
import '../widgets/textfiled/textformfiled_cut.dart';
import '../widgets/types_products_widget/substype_widget.dart';
import '../widgets/types_products_widget/type_products_widget.dart';
import '../widgets/home_widgets/view_widget_products_home/details_products_widget.dart';
import '../widgets/types_products_widget/type_products_widget_searching.dart';
import '../widgets/types_products_widget/users_products.dart';

class TheTypes extends StatelessWidget {
  const TheTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.theMainColor,
          body: SafeArea(
              child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "115".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.blackNumberFourBlackMode,
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                      child: TextFormFiledCus(
                        keyboardType: TextInputType.name,
                        autofillHints: [AutofillHints.name],
                        obscureText: false,
                        controllerData: controller.searchingTheTypes,
                        value: (value) {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          controller.TheNameProductsToSearching.value =
                              value.toString();
                          controller.isTheUserIsWantSearhingProducts.value =
                              true;

                          return null;
                        },
                        onChanged: (val) {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);

                          controller.TheNameProductsToSearching.value =
                              val.toString();
                          controller.isTheUserIsWantSearhingProducts.value =
                              true;
                          controller.showTheProductUsers.value = false;
                          controller.showTheProductTypeOneClothes.value = false;
                          controller.showTheProductTypeTwoShoes.value = false;
                          controller.showTheProductTypeThreeSports.value =
                              false;
                          controller.showTheProductTypeFourPerfumes.value =
                              false;

                          controller.subTypeProductOne.value = false;
                          controller.subTypeProductTwo.value = false;
                          controller.subTypeProductThree.value = false;
                          controller.subTypeProductFour.value = false;

                          controller.subTypeProductFive.value = false;
                          controller.subTypeProductSix.value = false;

                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "13".tr;
                          }
                          return value.length > 20 ? "13".tr : null;
                        },
                        hintData: "218".tr,
                        iconData: Icons.search,
                        labelData: "218".tr,
                        fillColor: Colors.white,
                        iconColor: AppColors.blackNumberFourBlackMode,
                        hintColor: AppColors.theMainOfColor,
                        fontColor: AppColors.blackNumberFourBlackMode,
                        borderSideColor: Colors.white,
                      ),
                    ),
                  )),
              Visibility(
                visible: controller.isTheUserIsWantSearhingProducts.value,
                child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.11),
                    child: InkWell(
                      onTap: () {
                        controller.isTheUserIsWantSearhingProducts.value =
                            false;
                        controller.searchingTheTypes.clear();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.09),
                              child: Image.asset(
                                "${ImagesPath.closeTheStatus}",
                                width: screenWidth * 0.1,
                              )),
                        ],
                      ),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.18),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          width: screenWidth,
                          height: screenHeight / 22,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              false;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = false;
                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = false;
                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = false;

                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                              .showTheProductTypeOneClothes
                                                              .value ==
                                                          false &&
                                                      controller
                                                              .showTheProductTypeTwoShoes
                                                              .value ==
                                                          false &&
                                                      controller
                                                              .showTheProductTypeThreeSports
                                                              .value ==
                                                          false &&
                                                      controller
                                                              .showTheProductTypeFourPerfumes
                                                              .value ==
                                                          false
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "120".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = false;
                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = false;
                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = false;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = true;

                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                      .showTheProductTypeOneClothes
                                                      .value
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "116".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              false;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = false;

                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = false;
                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = true;
                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                      .showTheProductTypeTwoShoes
                                                      .value
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "117".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              false;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = false;

                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = false;
                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = true;
                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                      .showTheProductTypeThreeSports
                                                      .value
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "118".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              false;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = false;
                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = false;

                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = true;
                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                      .showTheProductTypeFourPerfumes
                                                      .value
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "119".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          )))),
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.24),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          width: screenWidth,
                          height: screenHeight / 5,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.showTheProductUsers
                                                      .value = false;
                                                  controller.subTypeProductOne
                                                      .value = true;
                                                  controller.subTypeProductTwo
                                                      .value = false;
                                                  controller.subTypeProductThree
                                                      .value = false;
                                                  controller.subTypeProductFour
                                                      .value = false;
                                                  controller.subTypeProductFive
                                                      .value = false;
                                                  controller.subTypeProductSix
                                                      .value = false;
                                                },
                                                child: Container(
                                                  height: screenHeight / 14,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .subTypeProductOne
                                                                  .value ==
                                                              true
                                                          ? Colors.amber
                                                          : AppColors
                                                              .WelcomeWhiteColor,
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    "${ImagesPath.subStypeNumberOneTshirt}",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "219".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    SizedBox(
                                      width: screenWidth * 0.05,
                                    ),
                                    Row(children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.showTheProductUsers
                                                      .value = false;
                                                  controller.subTypeProductOne
                                                      .value = false;
                                                  controller.subTypeProductTwo
                                                      .value = true;
                                                  controller.subTypeProductThree
                                                      .value = false;
                                                  controller.subTypeProductFour
                                                      .value = false;
                                                  controller.subTypeProductFive
                                                      .value = false;
                                                  controller.subTypeProductSix
                                                      .value = false;
                                                },
                                                child: Container(
                                                  height: screenHeight / 14,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .subTypeProductTwo
                                                                  .value ==
                                                              true
                                                          ? Colors.amber
                                                          : AppColors
                                                              .WelcomeWhiteColor,
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    "${ImagesPath.subStypeNumberTwoDress}",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "220".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    SizedBox(
                                      width: screenWidth * 0.05,
                                    ),
                                    Row(children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.showTheProductUsers
                                                      .value = false;
                                                  controller.subTypeProductOne
                                                      .value = false;
                                                  controller.subTypeProductTwo
                                                      .value = false;
                                                  controller.subTypeProductThree
                                                      .value = true;
                                                  controller.subTypeProductFour
                                                      .value = false;
                                                  controller.subTypeProductFive
                                                      .value = false;
                                                  controller.subTypeProductSix
                                                      .value = false;
                                                },
                                                child: Container(
                                                  height: screenHeight / 14,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .subTypeProductThree
                                                                  .value ==
                                                              true
                                                          ? Colors.amber
                                                          : AppColors
                                                              .WelcomeWhiteColor,
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    "${ImagesPath.subStypeNumberThreePants}",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "221".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    SizedBox(
                                      width: screenWidth * 0.05,
                                    ),
                                    Row(children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.showTheProductUsers
                                                      .value = false;
                                                  controller.subTypeProductOne
                                                      .value = false;
                                                  controller.subTypeProductTwo
                                                      .value = false;
                                                  controller.subTypeProductThree
                                                      .value = false;
                                                  controller.subTypeProductFour
                                                      .value = true;

                                                  controller.subTypeProductFive
                                                      .value = false;
                                                  controller.subTypeProductSix
                                                      .value = false;
                                                },
                                                child: Container(
                                                  height: screenHeight / 14,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .subTypeProductFour
                                                                  .value ==
                                                              true
                                                          ? Colors.amber
                                                          : AppColors
                                                              .WelcomeWhiteColor,
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    "${ImagesPath.subStypeNumberFourJacket}",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "222".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    SizedBox(
                                      width: screenWidth * 0.05,
                                    ),
                                    Row(children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.showTheProductUsers
                                                      .value = false;
                                                  controller.subTypeProductOne
                                                      .value = false;
                                                  controller.subTypeProductTwo
                                                      .value = false;
                                                  controller.subTypeProductThree
                                                      .value = false;
                                                  controller.subTypeProductFour
                                                      .value = false;

                                                  controller.subTypeProductFive
                                                      .value = false;
                                                  controller.subTypeProductSix
                                                      .value = true;
                                                },
                                                child: Container(
                                                  height: screenHeight / 14,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .subTypeProductSix
                                                                  .value ==
                                                              true
                                                          ? Colors.amber
                                                          : AppColors
                                                              .WelcomeWhiteColor,
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    "${ImagesPath.subStypeNumberFiveBag}",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "223".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ])
                                  ]))))),
              Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.375),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          width: screenWidth,
                          height: screenHeight / 22,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.showTheProductUsers.value =
                                              true;
                                          controller
                                              .showTheProductTypeOneClothes
                                              .value = false;
                                          controller.showTheProductTypeTwoShoes
                                              .value = false;
                                          controller
                                              .showTheProductTypeThreeSports
                                              .value = false;
                                          controller
                                              .showTheProductTypeFourPerfumes
                                              .value = false;

                                          controller.subTypeProductOne.value =
                                              false;
                                          controller.subTypeProductTwo.value =
                                              false;
                                          controller.subTypeProductThree.value =
                                              false;
                                          controller.subTypeProductFour.value =
                                              false;

                                          controller.subTypeProductFive.value =
                                              false;
                                          controller.subTypeProductSix.value =
                                              false;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .showTheProductUsers
                                                          .value ==
                                                      true
                                                  ? AppColors.WelcomeRed
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.04),
                                            child: Text(
                                              "299".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          )))),
              Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.44, bottom: screenHeight * 0.12),
                  child: Align(
                    alignment: Alignment.center,
                    child: controller.subTypeProductOne.value == true ||
                            controller.subTypeProductTwo.value == true ||
                            controller.subTypeProductThree.value == true ||
                            controller.subTypeProductFour.value == true ||
                            controller.subTypeProductSix.value == true
                        ? SubStypesProducts()
                        : controller.isTheUserIsWantSearhingProducts.value ==
                                false
                            ? controller.showTheProductUsers.value == true
                                ? ViewTheProductsUsers()
                                : ViewTheProductsTypes()
                            : TypeTheProductsWidgetSearching(),
                  )),
              Menu(),
              DetailsProducts(),
            ],
          ))),
    );
  }
}
