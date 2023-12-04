import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/images_path.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../screens/brands.dart';

class DetailsProducts extends StatelessWidget {
  const DetailsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.viewTheDetilas.value,
            child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(children: [
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
                                controller.viewTheDetilas.value = false;
                              },
                              child: Text(
                                "96".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color:
                                        const Color.fromARGB(255, 47, 47, 47),
                                    fontSize: screenWidth * 0.043,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.07),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CachedNetworkImage(
                          height: screenHeight * 0.27,
                          width: screenWidth * 0.60,
                          fit: BoxFit.contain,
                          imageUrl: ("${controller.product.imagePro}"),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
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
                                      AppColors.yellow)),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),

                  Row(
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
                                controller.viewTheDetilas.value = false;
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
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.4075),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: GetX<ChangeLanguageToLocale>(
                              builder: (scontroller) =>
                                  scontroller.changeLangData == 1
                                      ? Text(
                                          "${controller.product.namePro}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.057,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          "${controller.product.nameProEn}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.057,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        )))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.0,
                            right: screenWidth * 0.06,
                            left: screenWidth * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.theNameOfCoins.value}".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.WelcomeRed,
                                  fontSize: screenWidth * 0.050,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              controller.theCoins.value == 2
                                  ? "${controller.theOldPrice.toStringAsFixed(4)}"
                                  : "${controller.product.oldPrice}",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.WelcomeRed,
                                  fontSize: screenWidth * 0.050,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.0,
                                  right: screenWidth * 0.06,
                                  left: screenWidth * 0.04),
                              child: Container(
                                width: screenWidth / 5,
                                height: screenHeight * 0.002,
                                color: AppColors.WelcomeRed,
                              ))),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.07,
                            right: screenWidth * 0.06,
                            left: screenWidth * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.theNameOfCoins.value}".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.blackNumberFourBlackMode,
                                  fontSize: screenWidth * 0.050,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              controller.theCoins.value == 2
                                  ? "${controller.thePrice.toStringAsFixed(4)}"
                                  : "${controller.product.pricePro}",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.blackNumberFourBlackMode,
                                  fontSize: screenWidth * 0.050,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.15,
                          right: screenWidth * 0.06,
                          left: screenWidth * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "97".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: const Color.fromARGB(255, 47, 47, 47),
                                fontSize: screenWidth * 0.049,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          GetX<ChangeLanguageToLocale>(
                              builder: (scontroller) =>
                                  scontroller.changeLangData == 1
                                      ? Text(
                                          "${controller.product.nameBrandAr}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.teal,
                                              fontSize: screenWidth * 0.049,
                                              fontWeight: FontWeight.w900),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          "${controller.product.nameBrandEn}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.teal,
                                              fontSize: screenWidth * 0.049,
                                              fontWeight: FontWeight.w900),
                                          textAlign: TextAlign.center,
                                        )),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.14,
                          left: screenWidth * 0.06,
                          right: screenWidth * 0.06),
                      child: InkWell(
                        onTap: () {
                          controller.viewTheDetilas.value = false;
                          Get.to(Brands());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "99".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Color.fromARGB(255, 47, 46, 46),
                                  fontSize: screenWidth * 0.049,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            GetX<ChangeLanguageToLocale>(
                                builder: (scontroller) =>
                                    scontroller.changeLangData == 1
                                        ? Image.asset(
                                            "${ImagesPath.arrowIconLeft}",
                                            width: screenWidth * 0.075,
                                          )
                                        : Image.asset(
                                            "${ImagesPath.arrowIconRight}",
                                            width: screenWidth * 0.075,
                                          )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.29,
                          right: screenWidth * 0.06,
                          left: screenWidth * 0.06,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "100".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.black,
                                fontSize: screenWidth * 0.051,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.47),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.07,
                              horizontal: screenWidth * 0.1),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.12,
                            child: SingleChildScrollView(
                              child: GetX<ChangeLanguageToLocale>(
                                  builder: (scontroller) =>
                                      scontroller.changeLangData == 1
                                          ? Text(
                                              "${controller.product.bodyPro}",
                                              style: TextStyle(
                                                  height: screenHeight * 0.0018,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: screenWidth * 0.041,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                              maxLines: 4,
                                            )
                                          : Text(
                                              "${controller.product.bodyProEn}",
                                              style: TextStyle(
                                                  height: screenHeight * 0.0018,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: screenWidth * 0.041,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                              maxLines: 4,
                                            )),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.36),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "282".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: AppColors.balckgray,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.04,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.isHaveTheProductSize.value ==
                                    true) {
                                  controller.TheListOfSizesProducts.value =
                                      true;
                                }
                              },
                              child: Container(
                                width: screenWidth * 0.45,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 237, 237),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Text(
                                    controller.isHaveTheProductSize.value
                                        ? "283".tr
                                        : "284".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: controller
                                                .isHaveTheProductSize.value
                                            ? AppColors.balckgray
                                            : AppColors.WelcomeRed,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "285".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: AppColors.balckgray,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.04,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.isHaveTheProductColor.value ==
                                    true) {
                                  controller.TheListOfcolorsProducts.value =
                                      true;
                                }
                              },
                              child: Container(
                                width: screenWidth * 0.45,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 237, 237),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04),
                                  child: Text(
                                    controller.isHaveTheProductColor.value
                                        ? "286".tr
                                        : "287".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: controller
                                                .isHaveTheProductColor.value
                                            ? AppColors.balckgray
                                            : AppColors.WelcomeRed,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: InkWell(
                            onTap: () {
                              controller.priceSm = int.parse(
                                  controller.product.pricePro.toString());
                              controller.num = int.parse(
                                  controller.product.pricePro.toString());
                              controller.openTheShoppingCart();
                            },
                            child: Container(
                              width: screenWidth * 0.54,
                              decoration: BoxDecoration(
                                  color: controller
                                          .waitToOpenAddTheShoppingCart.value
                                      ? AppColors.yellow
                                      : AppColors.WelcomeRed,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                controller.waitToOpenAddTheShoppingCart.value
                                    ? "101".tr
                                    : "102".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.050,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))),
///////////////////The Sizes/////////////////////////////////////////////
                  Visibility(
                      visible: controller.TheListOfSizesProducts.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.TheListOfSizesProducts.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),

                  Visibility(
                      visible: controller.TheListOfSizesProducts.value,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.15),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05),
                                child: Container(
                                    width: screenWidth * 0.5,
                                    height: screenHeight / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color:
                                            Color.fromARGB(255, 234, 231, 231)),
                                    child: FutureBuilder(
                                        future: controller.getSizesTheProducts(
                                            controller.idTheProduct.toString()),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasError) {
                                            return Text('Something went wrong');
                                          } else if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  if (snapshot.hasData) {
                                                    return Padding(
                                                        padding: EdgeInsets.only(
                                                            top: screenHeight *
                                                                0.03,
                                                            bottom:
                                                                screenHeight *
                                                                    0.01),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      screenWidth *
                                                                          0.04),
                                                          child: Directionality(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    snapshot.data[
                                                                            'data'][i]
                                                                        [
                                                                        'size'],
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.050,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ]),
                                                          ),
                                                        ));
                                                  } else {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "94".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color(
                                                                  0xFFC70039),
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.038,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  /*   controller.product.idPro =
                                                    snapshot.data['data'][i]
                                                        ['color_name'];
                      
                                                controller.product.namePro =
                                                    snapshot.data['data'][i]
                                                        ['color'];*/
                                                });
                                          }
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                        })))),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                          child: Visibility(
                              visible: controller.TheListOfSizesProducts.value,
                              child: InkWell(
                                onTap: () {
                                  controller.TheListOfSizesProducts.value =
                                      false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.12,
                                  height: screenHeight / 20,
                                  decoration: BoxDecoration(
                                      color: AppColors.WelcomeRed,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )))),

                  ////////////////////////////The Colors/////////////////////////////////////

                  Visibility(
                      visible: controller.TheListOfcolorsProducts.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.TheListOfcolorsProducts.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),

                  Visibility(
                      visible: controller.TheListOfcolorsProducts.value,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.15),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05),
                                child: Container(
                                    width: screenWidth * 0.65,
                                    height: screenHeight / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color:
                                            Color.fromARGB(255, 234, 231, 231)),
                                    child: FutureBuilder(
                                        future: controller.getColorsTheProducts(
                                            controller.idTheProduct.toString()),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasError) {
                                            return Text('Something went wrong');
                                          } else if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  if (snapshot.hasData) {
                                                    return Padding(
                                                        padding: EdgeInsets.only(
                                                            top: screenHeight *
                                                                0.03,
                                                            bottom:
                                                                screenHeight *
                                                                    0.01),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      screenWidth *
                                                                          0.04),
                                                          child: Directionality(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    snapshot.data[
                                                                            'data'][i]
                                                                        [
                                                                        'color_name'],
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.050,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Text(
                                                                    snapshot.data[
                                                                            'data'][i]
                                                                        [
                                                                        'color'],
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.040,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        screenWidth *
                                                                            0.12,
                                                                    height:
                                                                        screenHeight /
                                                                            20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Color(int.parse(snapshot
                                                                          .data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'color']
                                                                          .toString())),
                                                                    ),
                                                                  )
                                                                ]),
                                                          ),
                                                        ));
                                                  } else {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "94".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color(
                                                                  0xFFC70039),
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.038,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  /*   controller.product.idPro =
                                                    snapshot.data['data'][i]
                                                        ['color_name'];
                      
                                                controller.product.namePro =
                                                    snapshot.data['data'][i]
                                                        ['color'];*/
                                                });
                                          } else {
                                            return Center(
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                              color: AppColors.WelcomeRed,
                                            )));
                                          }
                                        })))),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                          child: Visibility(
                              visible: controller.TheListOfcolorsProducts.value,
                              child: InkWell(
                                onTap: () {
                                  controller.TheListOfcolorsProducts.value =
                                      false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.12,
                                  height: screenHeight / 20,
                                  decoration: BoxDecoration(
                                      color: AppColors.WelcomeRed,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )))),

                  ///////////////////////////////////////////////////////////////////////////Wait//////////////////////
                  Visibility(
                      visible: controller.waitToOpenAddTheShoppingCart.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.waitToOpenAddTheShoppingCart.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                    visible: controller.waitToOpenAddTheShoppingCart.value,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.09),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Lottie.asset("${ImagesPath.loadingWait}",
                              width: screenWidth * 0.3),
                        )),
                  ),
                  Visibility(
                      visible: controller.getAreadyToAddTheShoppingCart.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.getAreadyToAddTheShoppingCart.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black26,
                      )),
                  Visibility(
                      visible: controller.getAreadyToAddTheShoppingCart.value,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight / 1.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color.fromARGB(255, 234, 231, 231)),
                            child: Stack(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.07,
                                          right: screenWidth * 0.05,
                                          left: screenWidth * 0.05),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: CachedNetworkImage(
                                          height: screenHeight * 0.11,
                                          width: screenWidth * 0.30,
                                          fit: BoxFit.contain,
                                          imageUrl:
                                              ("${controller.product.imagePro}"),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            width: 15,
                                            height: 15,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          AppColors.yellow)),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      )),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.2,
                                          right: screenWidth * 0.08,
                                          left: screenWidth * 0.08),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: GetX<ChangeLanguageToLocale>(
                                              builder: (scontroller) =>
                                                  scontroller.changeLangData ==
                                                          1
                                                      ? Text(
                                                          "${controller.product.namePro}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.047,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      : Text(
                                                          "${controller.product.nameProEn}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.047,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )))),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.03,
                                          left: screenWidth * 0.05),
                                      child: InkWell(
                                        onTap: () {
                                          controller
                                              .getAreadyToAddTheShoppingCart
                                              .value = false;
                                          controller.priceSm = 0;
                                          controller.num = 0;
                                          controller.quProduct.value = 1;
                                        },
                                        child: Container(
                                          width: screenWidth * 0.34,
                                          decoration: BoxDecoration(
                                              color: AppColors.WelcomeRed,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "288".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.040,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ))),

                              //////////////The qu shoppingCart//////////

                              Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.055,
                                    left: screenWidth * 0.09,
                                    right: screenWidth * 0.19,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "104".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: screenHeight * 0.10,
                                  left: screenWidth * 0.11,
                                  right: screenWidth * 0.11,
                                ),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller
                                                .RemoveThequantityOfProducts();
                                          },
                                          child: Container(
                                            width: screenWidth * 0.1,
                                            height: screenHeight * 0.04,
                                            decoration: BoxDecoration(
                                                color: AppColors.WelcomeRed,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.0018,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.075,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.03,
                                        ),
                                        Text(
                                          "| ${controller.quProduct} |",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.03,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              controller
                                                  .AddThequantityOfProducts();
                                            },
                                            child: Container(
                                                width: screenWidth * 0.1,
                                                height: screenHeight * 0.04,
                                                decoration: BoxDecoration(
                                                    color: Colors.green[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        height: screenHeight *
                                                            0.0018,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.075,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ))),
                                      ],
                                    )),
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.03,
                                          right: screenWidth * 0.05),
                                      child: InkWell(
                                        onTap: () {
                                          if (controller.isHaveTheProductColor
                                                  .value ==
                                              false) {
                                            controller
                                                .whatIsChoseTheIDOfTheColor
                                                .value = 1;
                                          }
                                          if (controller
                                                  .isHaveTheProductSize.value ==
                                              false) {
                                            controller.whatIsChoseTheIDOfTheSize
                                                .value = 1;
                                          }

                                          if (controller.isHaveAccount.value ==
                                              1) {
                                            controller
                                                .isnothaveTheaccessRigthtoAddIntoShoppingCart
                                                .value = true;
                                          } else {
                                            controller
                                                .addViewCartIntoStorageMemory();
                                            controller.AddToTheListOFShoppingCart(
                                                controller.product.idPro
                                                    .toString(),
                                                controller.quProduct.value
                                                    .toString(),
                                                controller
                                                    .whatIsChoseTheIDOfTheColor
                                                    .value
                                                    .toString(),
                                                controller
                                                    .whatIsChoseTheIDOfTheSize
                                                    .value
                                                    .toString(),
                                                controller.priceSm.toString(),
                                                controller.randomNumber.value
                                                    .toString());
                                          }
                                        },
                                        child: Container(
                                          width: screenWidth * 0.34,
                                          decoration: BoxDecoration(
                                              color: AppColors.balckgray,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "105".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.040,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.16,
                                    left: screenWidth * 0.14,
                                    right: screenWidth * 0.14,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "106".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          Text(
                                            "${controller.product.pricePro}",
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.20,
                                    left: screenWidth * 0.14,
                                    right: screenWidth * 0.14,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "107".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          Text(
                                            "${controller.priceSm}",
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors.WelcomeRed,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ))),

                              ///////////////////////The Sizes ///////////////////////////////////////////////////////////////
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.26,
                                          right: screenWidth * 0.08,
                                          left: screenWidth * 0.08),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "289".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.047,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ))),
                                ],
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  top: screenHeight * 0.28,
                                ),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.05),
                                        child: controller
                                                .isHaveTheProductSize.value
                                            ? Container(
                                                alignment: Alignment.center,
                                                width: screenWidth,
                                                height: screenHeight / 11,
                                                child: FutureBuilder(
                                                    future: controller
                                                        .getSizesTheProducts(
                                                            controller
                                                                .idTheProduct
                                                                .toString()),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                      if (snapshot.hasError) {
                                                        return Text(
                                                            'Something went wrong');
                                                      } else if (snapshot
                                                          .hasData) {
                                                        return ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: snapshot
                                                                .data['data']
                                                                .length,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context, i) {
                                                              if (snapshot
                                                                  .hasData) {
                                                                return Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: screenHeight *
                                                                            0.03,
                                                                        bottom: screenHeight *
                                                                            0.01),
                                                                    child: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                                                                        child: GetX<HomeController>(
                                                                          builder: (theController) =>
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              theController.whatIsChoseTheIDOfTheSize.value = int.parse(snapshot.data['data'][i]['id_size'].toString());
                                                                            },
                                                                            child:
                                                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              AnimatedContainer(
                                                                                  alignment: Alignment.center,
                                                                                  duration: Duration(milliseconds: 750),
                                                                                  height: screenHeight / 11,
                                                                                  decoration: BoxDecoration(
                                                                                    color: theController.whatIsChoseTheIDOfTheSize.value == int.parse(snapshot.data['data'][i]['id_size'].toString()) ? Colors.amber : Color.fromARGB(255, 234, 231, 231),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                                                                    child: Text(
                                                                                      "${snapshot.data['data'][i]['size']}",
                                                                                      style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.047, fontWeight: FontWeight.w400),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  ))
                                                                            ]),
                                                                          ),
                                                                        )));
                                                              } else {
                                                                return Center(
                                                                    child: Center(
                                                                        child: CircularProgressIndicator(
                                                                  color: AppColors
                                                                      .WelcomeRed,
                                                                )));
                                                              }
                                                            });
                                                      } else {
                                                        return Center(
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                          color: AppColors
                                                              .WelcomeRed,
                                                        )));
                                                      }
                                                    }))
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.05),
                                                child: Text(
                                                  "290".tr,
                                                  style: TextStyle(
                                                      height:
                                                          screenHeight * 0.002,
                                                      fontFamily: 'Cairo',
                                                      color: Color(0xFFC70039),
                                                      fontSize:
                                                          screenWidth * 0.048,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ))),
                              ),

                              ///////////////////////The Colors ///////////////////////////////////////////////////////////////
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.385,
                                          right: screenWidth * 0.08,
                                          left: screenWidth * 0.08),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "291".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.047,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ))),
                                ],
                              ),
                              //////////////////////////////////////////////

                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.09),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.05),
                                        child: controller
                                                .isHaveTheProductColor.value
                                            ? Container(
                                                alignment: Alignment.center,
                                                width: screenWidth,
                                                height: screenHeight / 11,
                                                child: FutureBuilder(
                                                    future: controller
                                                        .getColorsTheProducts(
                                                            controller
                                                                .idTheProduct
                                                                .toString()),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                      if (snapshot.hasError) {
                                                        return Text(
                                                            'Something went wrong');
                                                      } else if (snapshot
                                                          .hasData) {
                                                        return ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: snapshot
                                                                .data['data']
                                                                .length,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context, i) {
                                                              if (snapshot
                                                                  .hasData) {
                                                                return Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: screenHeight *
                                                                            0.03,
                                                                        bottom: screenHeight *
                                                                            0.01),
                                                                    child: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                                                                        child: GetX<HomeController>(
                                                                          builder: (theController) =>
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              theController.whatIsChoseTheIDOfTheColor.value = int.parse(snapshot.data['data'][i]['id_color'].toString());
                                                                            },
                                                                            child:
                                                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              AnimatedContainer(
                                                                                duration: Duration(milliseconds: 750),
                                                                                width: theController.whatIsChoseTheIDOfTheColor.value == int.parse(snapshot.data['data'][i]['id_color'].toString()) ? screenWidth * 0.16 : screenWidth * 0.12,
                                                                                height: screenHeight / 20,
                                                                                decoration: BoxDecoration(
                                                                                  shape: theController.whatIsChoseTheIDOfTheColor.value == int.parse(snapshot.data['data'][i]['id_color'].toString()) ? BoxShape.rectangle : BoxShape.circle,
                                                                                  color: Color(int.parse(snapshot.data['data'][i]['color'].toString())),
                                                                                ),
                                                                              )
                                                                            ]),
                                                                          ),
                                                                        )));
                                                              } else {
                                                                return Center(
                                                                    child: Center(
                                                                        child: CircularProgressIndicator(
                                                                  color: AppColors
                                                                      .WelcomeRed,
                                                                )));
                                                              }
                                                              /*   controller.product.idPro =
                                                    snapshot.data['data'][i]
                                                        ['color_name'];
                      
                                                controller.product.namePro =
                                                    snapshot.data['data'][i]
                                                        ['color'];*/
                                                            });
                                                      } else {
                                                        return Center(
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                          color: AppColors
                                                              .WelcomeRed,
                                                        )));
                                                      }
                                                    }))
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        screenHeight * 0.01),
                                                child: Text(
                                                  "292".tr,
                                                  style: TextStyle(
                                                      height:
                                                          screenHeight * 0.002,
                                                      fontFamily: 'Cairo',
                                                      color: Color(0xFFC70039),
                                                      fontSize:
                                                          screenWidth * 0.048,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ))),
                              )
                              ////////////////////////
                            ]),
                          ),
                        ),
                      )),
                  Visibility(
                      visible: controller
                          .isnothaveTheaccessRigthtoAddIntoShoppingCart.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Container(
                                  width: screenWidth,
                                  height: screenHeight / 1.7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black45))))),
                  Visibility(
                      visible: controller
                          .isnothaveTheaccessRigthtoAddIntoShoppingCart.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Container(
                                  width: screenWidth,
                                  height: screenHeight / 1.7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black45))))),
                  Visibility(
                      visible: controller
                          .isnothaveTheaccessRigthtoAddIntoShoppingCart.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Lottie.asset("${ImagesPath.loadingWait}",
                                      width: screenWidth * 0.3),
                                  SizedBox(
                                    height: screenWidth * 0.015,
                                  ),
                                  Text(
                                    "108".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )))),

                  Visibility(
                      visible: controller
                          .isnothaveTheaccessRigthtoAddIntoShoppingCart.value,
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
                                  controller
                                      .isnothaveTheaccessRigthtoAddIntoShoppingCart
                                      .value = false;
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
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.14),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Text(
                                        "298".tr,
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
                  Visibility(
                      visible: controller.isAddIntoTheCartShoppingWaiting.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Container(
                                  width: screenWidth,
                                  height: screenHeight / 1.7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black45))))),
                  Visibility(
                      visible: controller.isAddIntoTheCartShoppingWaiting.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: Container(
                                  width: screenWidth,
                                  height: screenHeight / 1.7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black45))))),
                  Visibility(
                      visible: controller.isAddIntoTheCartShoppingWaiting.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Lottie.asset("${ImagesPath.loadingWait}",
                                      width: screenWidth * 0.3),
                                  SizedBox(
                                    height: screenWidth * 0.015,
                                  ),
                                  Text(
                                    "108".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )))),
                  Visibility(
                      visible: controller.isAddIntoTheCartShopping.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black45,
                      )),
                  Visibility(
                      visible: controller.isAddIntoTheCartShopping.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black45,
                      )),
                  Visibility(
                      visible: controller.isAddIntoTheCartShopping.value,
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.4),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset("${ImagesPath.successfully}",
                                    width: screenWidth * 0.3),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Text(
                                  "109".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.1,
                                ),
                              ]),
                        ),
                      )),
                  Visibility(
                      visible: controller.isAddIntoTheCartShopping.value,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.07),
                              child: InkWell(
                                onTap: () {
                                  controller.isAddIntoTheCartShopping.value =
                                      false;
                                },
                                child: Container(
                                  width: screenWidth * 0.54,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "110".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )))),
                ]))));
  }
}
