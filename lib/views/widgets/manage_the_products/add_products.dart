import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/appcolors.dart';
import 'package:path/path.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/localization/changelanguage.dart';
import '../../screens/manage_the_products_user.dart';
import '../textfiled/textformfiled_cut.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class AddTheProducts extends StatefulWidget {
  const AddTheProducts({super.key});

  @override
  State<AddTheProducts> createState() => _AddTheProductsState();
}

class _AddTheProductsState extends State<AddTheProducts> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.showTheAddPage.value,
        child: SafeArea(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: AppColors.theMainColor,
                  child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.07),
                      child: Form(
                          key: controller.addProducts,
                          child: ListView(children: [
                            Column(children: [
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Text(
                                "157".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.name,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.name_product,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.name_product_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.name_product_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 || value.length > 30
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "158".tr,
                                  iconData: Icons.title,
                                  labelData: "158".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.name,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.name_product_en,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.name_product_en_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.name_product_en_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 || value.length > 30
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "159".tr,
                                  iconData: Icons.title,
                                  labelData: "159".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.name,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.body_product,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.body_product_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.body_product_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 ||
                                            value.length > 120
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "160".tr,
                                  iconData: Icons.details,
                                  labelData: "160".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.name,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.body_product_en,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.body_product_en_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.body_product_en_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 ||
                                            value.length > 120
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "161".tr,
                                  iconData: Icons.details,
                                  labelData: "161".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.number,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.old_price,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.old_price_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.old_price_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 || value.length > 10
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "162".tr,
                                  iconData: Icons.price_change_outlined,
                                  labelData: "162".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.09),
                                child: TextFormFiledCus(
                                  keyboardType: TextInputType.number,
                                  autofillHints: [AutofillHints.name],
                                  obscureText: false,
                                  controllerData: controller.price_product,
                                  value: (value) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.price_product_AddDataBase =
                                        value.toString();

                                    return null;
                                  },
                                  onChanged: (val) {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.manual,
                                        overlays: []);
                                    controller.price_product_AddDataBase =
                                        val.toString();

                                    return null;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "13".tr;
                                    }
                                    return value.length < 1 || value.length > 10
                                        ? "13".tr
                                        : null;
                                  },
                                  hintData: "163".tr,
                                  iconData: Icons.price_change_outlined,
                                  labelData: "163".tr,
                                  fillColor: Colors.white,
                                  iconColor: AppColors.blackNumberFourBlackMode,
                                  hintColor: AppColors.theMainOfColor,
                                  fontColor: AppColors.blackNumberFourBlackMode,
                                  borderSideColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Text(
                                "164".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .OptionTheProductType.value = 5;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          height: screenHeight / 22,
                                          width: controller.OptionTheProductType
                                                      .value ==
                                                  5
                                              ? screenWidth * 0.30
                                              : screenWidth * 0.25,
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .OptionTheProductType
                                                          .value ==
                                                      5
                                                  ? Colors.amber
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          child: Center(
                                            child: Text(
                                              "165".tr,
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors.white,
                                                fontSize: screenWidth * 0.042,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller
                                                .OptionTheProductType.value = 6;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductType
                                                        .value ==
                                                    6
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductType
                                                            .value ==
                                                        6
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "166".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller
                                                .OptionTheProductType.value = 7;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductType
                                                        .value ==
                                                    7
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductType
                                                            .value ==
                                                        7
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "167".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller
                                                .OptionTheProductType.value = 8;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductType
                                                        .value ==
                                                    8
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductType
                                                            .value ==
                                                        8
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "168".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Text(
                                "169".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 1;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    1
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        1
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "170".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 2;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    2
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        2
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "171".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 3;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    3
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        3
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "172".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 4;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    4
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        4
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "173".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 6;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    6
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        6
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "174".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OptionTheProductSubType
                                                .value = 0;
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            height: screenHeight / 22,
                                            width: controller
                                                        .OptionTheProductSubType
                                                        .value ==
                                                    0
                                                ? screenWidth * 0.30
                                                : screenWidth * 0.25,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .OptionTheProductSubType
                                                            .value ==
                                                        0
                                                    ? Colors.amber
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                "175".tr,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.white,
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Text(
                                "176".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              SizedBox(
                                  height: screenHeight * 0.3,
                                  child: FutureBuilder(
                                    future: controller.getAllDataBrands(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data;
                                        if (data == null) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "94".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Color(0xFFC70039),
                                                    fontSize:
                                                        screenWidth * 0.038,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          );
                                        } else
                                          return GridView.builder(
                                              itemCount:
                                                  snapshot.data['data'].length,
                                              itemBuilder: (context, i) {
                                                controller.Thebrand.idBrand =
                                                    snapshot.data['data'][i]
                                                            ['id_brand']
                                                        .toString();

                                                return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 2),
                                                    child: InkWell(
                                                        onTap: () async {
                                                          controller
                                                                  .OptionTheProductBrands
                                                                  .value =
                                                              int.parse(snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'id_brand']
                                                                  .toString());
                                                        },
                                                        child: GetX<
                                                                HomeController>(
                                                            builder:
                                                                (Thecontroller) =>
                                                                    AnimatedContainer(
                                                                      duration: Duration(
                                                                          seconds:
                                                                              1),
                                                                      color: Thecontroller.OptionTheProductBrands.value ==
                                                                              int.parse(snapshot.data['data'][i]['id_brand']
                                                                                  .toString())
                                                                          ? AppColors
                                                                              .yellow
                                                                          : AppColors
                                                                              .white,
                                                                      child: Stack(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: screenHeight * 0.00),
                                                                              child: Align(
                                                                                  alignment: Alignment.topCenter,
                                                                                  child: Container(
                                                                                    width: screenWidth * 0.45,
                                                                                    height: screenHeight * 0.15,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(7), bottomLeft: Radius.circular(7))),
                                                                                    child: CachedNetworkImage(
                                                                                      width: screenWidth * 0.45,
                                                                                      height: screenHeight * 0.15,
                                                                                      fit: BoxFit.cover,
                                                                                      imageUrl: ("${snapshot.data['data'][i]['image_brand'].toString()}"),
                                                                                      imageBuilder: (context, imageProvider) => Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                                                                          image: DecorationImage(
                                                                                            image: imageProvider,
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      placeholder: (context, url) => SizedBox(
                                                                                        width: 15,
                                                                                        height: 15,
                                                                                        child: Center(
                                                                                          child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            AppColors.WelcomeRed,
                                                                                          )),
                                                                                        ),
                                                                                      ),
                                                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                    ),
                                                                                  )),
                                                                            ),

                                                                            ////////////////

                                                                            ///////////////////
                                                                            Align(
                                                                                alignment: Alignment.bottomCenter,
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.only(left: screenWidth * 0.00),
                                                                                  child: Container(
                                                                                      width: screenWidth * 0.30,
                                                                                      child: GetX<ChangeLanguageToLocale>(
                                                                                        builder: (scontroller) => scontroller.changeLangData == 1
                                                                                            ? Text(
                                                                                                ("${snapshot.data['data'][i]['name_brand_ar'].toString()}"),
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'Cairo',
                                                                                                  color: AppColors.balckgray,
                                                                                                  fontSize: screenWidth * 0.042,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                maxLines: 1,
                                                                                              )
                                                                                            : Text(
                                                                                                ("${snapshot.data['data'][i]['name_brand_en'].toString()}"),
                                                                                                style: TextStyle(
                                                                                                  fontFamily: 'Cairo',
                                                                                                  color: AppColors.balckgray,
                                                                                                  fontSize: screenWidth * 0.042,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                maxLines: 1,
                                                                                              ),
                                                                                      )),
                                                                                )),
                                                                          ]),
                                                                    ))));
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            1.7),
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 0.0,
                                                crossAxisSpacing: 0.0,
                                              ));
                                      } else {
                                        return Shimmer(
                                          duration: Duration(
                                              seconds: 45), //Default value
                                          interval: Duration(
                                              seconds:
                                                  45), //Default value: Duration(seconds: 0)
                                          color: Colors.white, //Default value
                                          colorOpacity: 0, //Default value
                                          enabled: true, //Default value
                                          direction: ShimmerDirection
                                              .fromLTRB(), //Default Value
                                          child: Container(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: screenWidth,
                                            height: screenHeight,
                                          ),
                                        );
                                      }
                                    },
                                  )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Text(
                                "177".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.OptionTheProductBrands.value = 0;
                                },
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: screenHeight / 22,
                                  width: screenWidth * 0.55,
                                  decoration: BoxDecoration(
                                      color: controller.OptionTheProductBrands
                                                  .value ==
                                              0
                                          ? Colors.amber
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Center(
                                    child: Text(
                                      "178".tr,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.white,
                                        fontSize: screenWidth * 0.042,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Text(
                                "179".tr,
                                style: TextStyle(
                                    height: screenHeight * 0.0012,
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              InkWell(
                                onTap: () async {
                                  XFile? xfile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xfile != null) {
                                    Random random = new Random();
                                    int randomNumber = random.nextInt(10000000);
                                    File myfile = await File(xfile!.path);

                                    String dir =
                                        (await getApplicationDocumentsDirectory())
                                            .path;
                                    String newPath =
                                        path.join(dir, '$randomNumber.jpg');
                                    File f =
                                        await File(myfile.path).copy(newPath);

                                    Timer.periodic(Duration(seconds: 1),
                                        (Timer timer) {
                                      if (myfile == null) {
                                      } else {
                                        if (controller.isChooesImage.value ==
                                            false) {
                                          setState(() {});

                                          controller.upIm(f);
                                          setState(() {
                                            controller.filename =
                                                basename(f.path);
                                          });
                                          controller.isChooesImage.value = true;
                                        } else {}
                                      }
                                    });
                                  } else {}

                                  /*   await Future.delayed(Duration(seconds: 15),
                                      () async {
                                    controller.upIm(myfile);
                                    setState(() {
                                      controller.filename =
                                          basename(myfile.path);
                                    });
                                    setState(() {});
                                  });*/
                                },
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: screenHeight / 22,
                                  width: screenWidth * 0.55,
                                  decoration: BoxDecoration(
                                      color: controller.isChooesImage.value
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Center(
                                    child: Text(
                                      controller.isChooesImage.value
                                          ? "تم إختيار الصورة"
                                          : "أختيار صورة ما".tr,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.white,
                                        fontSize: screenWidth * 0.042,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.addTheProducts(
                                      controller.name_product_AddDataBase
                                          .toString(),
                                      controller.name_product_en_AddDataBase
                                          .toString(),
                                      controller.body_product_AddDataBase
                                          .toString(),
                                      controller.body_product_en_AddDataBase
                                          .toString(),
                                      controller.price_product_AddDataBase
                                          .toString(),
                                      controller.old_price_AddDataBase
                                          .toString(),
                                      controller.OptionTheProductType.value,
                                      controller.OptionTheProductSubType.value,
                                      controller.OptionTheProductBrands.value,
                                      controller.filename.toString());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: screenHeight / 22,
                                  width: screenWidth * 0.55,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Center(
                                    child: Text(
                                      "180".tr,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.white,
                                        fontSize: screenWidth * 0.042,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                            ])
                          ])))),
            ),
            Visibility(
                visible: controller.loadingUploadToDatabase.value,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.black26,
                )),
            Visibility(
                visible: controller.loadingUploadToDatabase.value,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.black26,
                )),
            Visibility(
                visible: controller.loadingUploadToDatabase.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "181".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ))),
            Visibility(
                visible: controller.loadingUploadToDatabase.value,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.14),
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset("${ImagesPath.loadingWait}",
                        width: screenWidth * 0.21),
                  ),
                )), ////////////////Is already Upload////////////////////

            Visibility(
                visible: controller.isAlreadyUploadToDatabase.value,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.black26,
                )),
            Visibility(
                visible: controller.isAlreadyUploadToDatabase.value,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.black38,
                )),
            Visibility(
                visible: controller.isAlreadyUploadToDatabase.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "182".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ))),
            Visibility(
                visible: controller.isAlreadyUploadToDatabase.value,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.23),
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset("${ImagesPath.successfully}",
                        width: screenWidth * 0.31),
                  ),
                )),
            Visibility(
                visible: controller.isAlreadyUploadToDatabase.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                    child: InkWell(
                      onTap: () {
                        controller.isAlreadyUploadToDatabase.value = false;
                        Get.to(ManageTheProductsByTheUser());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        width: screenWidth * 0.4,
                        height: screenHeight / 20,
                        child: Center(
                            child: Text(
                          "183".tr,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.02,
                        right: screenWidth * 0.02,
                        left: screenWidth * 0.02),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          controller.showTheAddPage.value = false;
                        },
                        child: GetX<ChangeLanguageToLocale>(
                          builder: (scontroller) =>
                              scontroller.changeLangData == 1
                                  ? Image.asset(
                                      "${ImagesPath.arrowIconRight}",
                                      width: screenWidth * 0.09,
                                    )
                                  : Image.asset(
                                      "${ImagesPath.arrowIconLeft}",
                                      width: screenWidth * 0.09,
                                    ),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.02,
                        right: screenWidth * 0.12,
                        left: screenWidth * 0.12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          controller.showTheAddPage.value = false;
                        },
                        child: Text(
                          "184".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: const Color.fromARGB(255, 47, 47, 47),
                              fontSize: screenWidth * 0.043,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
