import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/images_path.dart';
import 'package:nara_test/views/screens/forget_password.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../widgets/textfiled/textformfiled_cut.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Stack(
              children: [
                Visibility(
                    visible: controller.LogInAuth.value,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.black12,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                        Container(
                          color: Colors.black12,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.80,
                            height: screenHeight * 0.75,
                            decoration: BoxDecoration(
                                color: AppColors.theMainColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.LogInAuth.value = false;
                                    },
                                    child: Container(
                                      width: screenWidth * 0.10,
                                      height: screenHeight * 0.04,
                                      decoration: BoxDecoration(
                                          color: AppColors.WelcomeRed,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Text(
                                        "X",
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors.white,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.SignUpAuth.value =
                                                  true;
                                              controller.LogInAuth.value =
                                                  false;
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  "10".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.balckgray,
                                                      fontSize:
                                                          screenWidth * 0.045,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.06,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "11".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.045,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.02,
                                              ),
                                              AnimatedContainer(
                                                duration: Duration(seconds: 3),
                                                width: screenWidth * 0.25,
                                                height: screenHeight * 0.003,
                                                color: controller
                                                        .LogInAuth.value
                                                    ? AppColors.WelcomeRed
                                                    : AppColors.balckgrayOne,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.2),
                                      child: Text(
                                        "12".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors.balckgray,
                                            fontSize: screenWidth * 0.065,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.3),
                                          child: TextFormFiledCus(
                                            keyboardType: TextInputType.name,
                                            autofillHints: [AutofillHints.name],
                                            obscureText: false,
                                            controllerData:
                                                controller.nameController,
                                            value: (value) {
                                              controller.nameUser =
                                                  value.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            onChanged: (val) {
                                              controller.nameUser =
                                                  val.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "13".tr;
                                              }
                                              return value.length < 5 ||
                                                      value.length > 20
                                                  ? "13".tr
                                                  : null;
                                            },
                                            hintData: "14".tr,
                                            iconData: Icons.person,
                                            labelData: "14".tr,
                                            fillColor: Colors.white,
                                            iconColor: AppColors
                                                .blackNumberFourBlackMode,
                                            hintColor: AppColors.theMainOfColor,
                                            fontColor: AppColors
                                                .blackNumberFourBlackMode,
                                            borderSideColor: Colors.white,
                                          ))),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.4),
                                          child: TextFormFiledCus(
                                            keyboardType: TextInputType.name,
                                            autofillHints: [AutofillHints.name],
                                            obscureText: false,
                                            controllerData:
                                                controller.nameController,
                                            value: (value) {
                                              controller.passwordUser =
                                                  value.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            onChanged: (val) {
                                              controller.passwordUser =
                                                  val.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "13".tr;
                                              }
                                              return value.length < 5 ||
                                                      value.length > 20
                                                  ? "13".tr
                                                  : null;
                                            },
                                            hintData: "15".tr,
                                            iconData: Icons.lock,
                                            labelData: "15".tr,
                                            fillColor: Colors.white,
                                            iconColor: AppColors
                                                .blackNumberFourBlackMode,
                                            hintColor: AppColors.theMainOfColor,
                                            fontColor: AppColors
                                                .blackNumberFourBlackMode,
                                            borderSideColor: Colors.white,
                                          ))),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.57),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(ForgetPassword());
                                            },
                                            child: Text(
                                              "17".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.WelcomeRed,
                                                  fontSize: screenWidth * 0.038,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.02,
                                          ),
                                          Text(
                                            "16".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors.balckgray,
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.WelcomeRed,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: screenWidth * 0.6,
                                        height: screenHeight / 20,
                                        child: Center(
                                            child: Text(
                                          "18".tr,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Visibility(
                    visible: controller.SignUpAuth.value,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.black12,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                        Container(
                          color: Colors.black12,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.80,
                            height: screenHeight * 0.75,
                            decoration: BoxDecoration(
                                color: AppColors.theMainColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.SignUpAuth.value = false;
                                    },
                                    child: Container(
                                      width: screenWidth * 0.10,
                                      height: screenHeight * 0.04,
                                      decoration: BoxDecoration(
                                          color: AppColors.WelcomeRed,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Text(
                                        "X",
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors.white,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.07),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "21".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.045,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.02,
                                              ),
                                              AnimatedContainer(
                                                duration: Duration(seconds: 9),
                                                width: screenWidth * 0.25,
                                                height: screenHeight * 0.003,
                                                color: controller
                                                        .SignUpAuth.value
                                                    ? AppColors.WelcomeRed
                                                    : AppColors.balckgrayOne,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.06,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.SignUpAuth.value =
                                                  false;
                                              controller.LogInAuth.value = true;
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  "22".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.balckgray,
                                                      fontSize:
                                                          screenWidth * 0.045,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.14),
                                      child: Text(
                                        "23".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors.balckgray,
                                            fontSize: screenWidth * 0.065,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.22),
                                          child: Form(
                                            key: controller.formSign,
                                            child: ListView(children: [
                                              Column(
                                                children: [
                                                  TextFormFiledCus(
                                                    keyboardType:
                                                        TextInputType.name,
                                                    autofillHints: [
                                                      AutofillHints.name
                                                    ],
                                                    obscureText: false,
                                                    controllerData: controller
                                                        .nameController,
                                                    value: (value) {
                                                      controller.addUserName =
                                                          value.toString();
                                                      controller.nameUser =
                                                          value.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    onChanged: (val) {
                                                      controller.addUserName =
                                                          val.toString();
                                                      controller.nameUser =
                                                          val.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "13".tr;
                                                      }
                                                      return value.length < 5 ||
                                                              value.length > 20
                                                          ? "13".tr
                                                          : null;
                                                    },
                                                    hintData: "24".tr,
                                                    iconData: Icons.person,
                                                    labelData: "24".tr,
                                                    fillColor: Colors.white,
                                                    iconColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    hintColor: AppColors
                                                        .theMainOfColor,
                                                    fontColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    borderSideColor:
                                                        Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.01,
                                                  ),
                                                  TextFormFiledCus(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    autofillHints: [
                                                      AutofillHints.name
                                                    ],
                                                    obscureText: false,
                                                    controllerData: controller
                                                        .phoneController,
                                                    value: (value) {
                                                      controller.phone =
                                                          value.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    onChanged: (val) {
                                                      controller.phone =
                                                          val.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "13".tr;
                                                      }
                                                      return value.length < 5 ||
                                                              value.length > 20
                                                          ? "13".tr
                                                          : null;
                                                    },
                                                    hintData: "25".tr,
                                                    iconData:
                                                        Icons.phone_android,
                                                    labelData: "25".tr,
                                                    fillColor: Colors.white,
                                                    iconColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    hintColor: AppColors
                                                        .theMainOfColor,
                                                    fontColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    borderSideColor:
                                                        Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.01,
                                                  ),
                                                  TextFormFiledCus(
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    autofillHints: [
                                                      AutofillHints.email
                                                    ],
                                                    obscureText: false,
                                                    controllerData: controller
                                                        .nameController,
                                                    value: (value) {
                                                      controller.emailUser =
                                                          value.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    onChanged: (val) {
                                                      controller.emailUser =
                                                          val.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "13".tr;
                                                      }
                                                      return value.length < 5 ||
                                                              value.length > 20
                                                          ? "13".tr
                                                          : null;
                                                    },
                                                    hintData: "26".tr,
                                                    iconData:
                                                        Icons.email_outlined,
                                                    labelData: "26".tr,
                                                    fillColor: Colors.white,
                                                    iconColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    hintColor: AppColors
                                                        .theMainOfColor,
                                                    fontColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    borderSideColor:
                                                        Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.01,
                                                  ),
                                                  TextFormFiledCus(
                                                    keyboardType:
                                                        TextInputType.name,
                                                    autofillHints: [
                                                      AutofillHints.password
                                                    ],
                                                    obscureText: false,
                                                    controllerData: controller
                                                        .passwordController,
                                                    value: (value) {
                                                      controller.passwordUser =
                                                          value.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    onChanged: (val) {
                                                      controller.passwordUser =
                                                          val.toString();

                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      return null;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "13".tr;
                                                      }
                                                      return value.length < 5 ||
                                                              value.length > 20
                                                          ? "13".tr
                                                          : null;
                                                    },
                                                    hintData: "27".tr,
                                                    iconData: Icons.lock,
                                                    labelData: "27".tr,
                                                    fillColor: Colors.white,
                                                    iconColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    hintColor: AppColors
                                                        .theMainOfColor,
                                                    fontColor: AppColors
                                                        .blackNumberFourBlackMode,
                                                    borderSideColor:
                                                        Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.03,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.07),
                                                    child: Text(
                                                      "28".tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .balckgray,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.035,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.03,
                                                  ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  screenWidth *
                                                                      0.04),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .chooesSix
                                                                  .value = 2;
                                                              controller.theSix
                                                                  .value = 2;
                                                            },
                                                            child: Container(
                                                              width:
                                                                  screenWidth /
                                                                      5,
                                                              height:
                                                                  screenHeight /
                                                                      22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "30".tr,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: controller.chooesSix.value ==
                                                                                2
                                                                            ? AppColors
                                                                                .WelcomeRed
                                                                            : AppColors
                                                                                .balckgray,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.045,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Visibility(
                                                                    visible: controller
                                                                            .chooesSix
                                                                            .value ==
                                                                        2,
                                                                    child: Image
                                                                        .asset(
                                                                      "${ImagesPath.iconCheck}",
                                                                      width: screenWidth *
                                                                          0.07,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.01,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .chooesSix
                                                                  .value = 1;
                                                              controller.theSix
                                                                  .value = 1;
                                                            },
                                                            child: Container(
                                                              width:
                                                                  screenWidth /
                                                                      5,
                                                              height:
                                                                  screenHeight /
                                                                      22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "31".tr,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: controller.chooesSix.value ==
                                                                                1
                                                                            ? AppColors
                                                                                .WelcomeRed
                                                                            : AppColors
                                                                                .balckgray,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.045,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Visibility(
                                                                    visible: controller
                                                                            .chooesSix
                                                                            .value ==
                                                                        1,
                                                                    child: Image
                                                                        .asset(
                                                                      "${ImagesPath.iconCheck}",
                                                                      width: screenWidth *
                                                                          0.07,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .chooesSix
                                                                  .value = 3;
                                                              controller.theSix
                                                                  .value = 3;
                                                            },
                                                            child: Container(
                                                              width:
                                                                  screenWidth /
                                                                      5,
                                                              height:
                                                                  screenHeight /
                                                                      22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "29".tr,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: controller.chooesSix.value ==
                                                                                3
                                                                            ? AppColors
                                                                                .WelcomeRed
                                                                            : AppColors
                                                                                .balckgray,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.045,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Visibility(
                                                                    visible: controller
                                                                            .chooesSix
                                                                            .value ==
                                                                        3,
                                                                    child: Image
                                                                        .asset(
                                                                      "${ImagesPath.iconCheck}",
                                                                      width: screenWidth *
                                                                          0.07,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.01,
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                    height: screenHeight * 0.06,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom:
                                                            screenHeight * 0.1),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .createAccountApi(
                                                                controller
                                                                    .addUserName
                                                                    .toString(),
                                                                controller
                                                                    .chooesSix
                                                                    .value);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .WelcomeRed,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width:
                                                            screenWidth * 0.6,
                                                        height:
                                                            screenHeight / 20,
                                                        child: Center(
                                                            child: Text(
                                                          "32".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: AppColors
                                                                  .white,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.045,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ))),
                                ),
                                Visibility(
                                    visible:
                                        controller.loadingCreateAccount.value,
                                    child: Container(
                                      width: screenWidth,
                                      height: screenHeight,
                                      color: Colors.black26,
                                    )),
                                Visibility(
                                    visible:
                                        controller.loadingCreateAccount.value,
                                    child: Container(
                                      width: screenWidth,
                                      height: screenHeight,
                                      color: Colors.black26,
                                    )),
                                Visibility(
                                    visible:
                                        controller.loadingCreateAccount.value,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "33".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.white,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ))),
                                Visibility(
                                    visible:
                                        controller.loadingCreateAccount.value,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.14),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Lottie.asset(
                                            "${ImagesPath.loadingWait}",
                                            width: screenWidth * 0.21),
                                      ),
                                    )),
                                Visibility(
                                    visible:
                                        controller.isAreadyCreateAccount.value,
                                    child: Container(
                                      width: screenWidth,
                                      height: screenHeight,
                                      color: Colors.black26,
                                    )),
                                Visibility(
                                    visible:
                                        controller.isAreadyCreateAccount.value,
                                    child: Container(
                                      width: screenWidth,
                                      height: screenHeight,
                                      color: Colors.black38,
                                    )),
                                Visibility(
                                    visible:
                                        controller.isAreadyCreateAccount.value,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "34".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.white,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ))),
                                Visibility(
                                    visible:
                                        controller.isAreadyCreateAccount.value,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.14),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Lottie.asset(
                                            "${ImagesPath.iscreateAccount}",
                                            width: screenWidth * 0.41),
                                      ),
                                    )),
                                Visibility(
                                    visible:
                                        controller.isAreadyCreateAccount.value,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: screenHeight * 0.07),
                                        child: InkWell(
                                          onTap: () {
                                            controller.SignUpAuth.value = false;
                                            controller.LogInAuth.value = false;
                                            controller.isAreadyCreateAccount
                                                .value = false;

                                            controller.showAccount.value =
                                                false;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: screenWidth * 0.4,
                                            height: screenHeight / 20,
                                            child: Center(
                                                child: Text(
                                              "42".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.black,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Visibility(
                    visible: controller.youDontEnterData.value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth * 0.60,
                        height: screenHeight * 0.29,
                        decoration: BoxDecoration(
                            color: AppColors.blackNumberFourBlackMode,
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.youDontEnterData.value = false;
                              },
                              child: Container(
                                width: screenWidth * 0.10,
                                height: screenHeight * 0.04,
                                decoration: BoxDecoration(
                                    color: AppColors.WelcomeRed,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.white,
                                      fontSize: screenWidth * 0.050,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.01),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Lottie.asset(
                                          "${ImagesPath.warning}",
                                          width: screenWidth * 0.3)))),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.14),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Text(
                                      "36".tr.tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors.white,
                                          fontSize: screenWidth * 0.037,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                        ]),
                      ),
                    )),
              ],
            ));
  }
}
