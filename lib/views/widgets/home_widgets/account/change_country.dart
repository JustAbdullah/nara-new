import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class ChangeCountry extends StatelessWidget {
  const ChangeCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.changeTheCountry.value,
            child: Stack(children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.black26,
              ),
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.black26,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                    visible: controller.changeTheCountry.value,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: Container(
                        width: screenWidth,
                        height: screenHeight / 1.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: SingleChildScrollView(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.07,
                              vertical: screenHeight * 0.03),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "122".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.blackNumberFourBlackMode,
                                      fontSize: screenWidth * 0.055,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.055),
                                child: Column(
                                  children: [
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 1;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.SaFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "123".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    1,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 2;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.KwFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "124".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    2,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 3;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.BaFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "125".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    3,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 4;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.omFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "126".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    4,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 5;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.IqFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "127".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    5,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 6;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.UaFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "128".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    6,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 7;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.qrFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "129".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    7,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                    SizedBox(height: screenHeight * 0.02),
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          controller.whatIsChoesAboutTheCountry
                                              .value = 8;
                                          controller.changeTheCountry.value =
                                              false;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "${ImagesPath.joFlagIcon}",
                                              width: screenWidth * 0.12,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            Text(
                                              "130".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.39,
                                            ),
                                            Visibility(
                                                visible: controller
                                                        .whatIsChoesAboutTheCountry
                                                        .value ==
                                                    8,
                                                child: Image.asset(
                                                  "${ImagesPath.iconCheckBlack}",
                                                  width: screenWidth * 0.07,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                        ),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.0003,
                                              color: AppColors.balckgray,
                                            )),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    )),
              )
            ])));
  }
}
