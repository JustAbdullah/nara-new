import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/images_path.dart';
import 'package:nara_test/views/screens/auth.dart';
import 'package:nara_test/views/screens/manage_the_products_user.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';
import '../../core/localization/changelanguage.dart';
import '../widgets/home_widgets/account/change_country.dart';
import '../widgets/menu/menu.dart';
import '../widgets/textfiled/textformfiled_cut.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class showMyAccount extends StatefulWidget {
  const showMyAccount({super.key});

  @override
  State<showMyAccount> createState() => _showMyAccountState();
}

class _showMyAccountState extends State<showMyAccount> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    ChangeLanguageToLocale change = Get.put(ChangeLanguageToLocale());
    return Scaffold(
        body: SafeArea(
            child: GetX<HomeController>(
      builder: (controller) => Container(
        width: screenWidth,
        height: screenHeight,
        color: AppColors.offerColor,
        child: Stack(
          children: [
            ////////////////////////////The main Options///////////
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  right: screenWidth * 0.1,
                  left: screenWidth * 0.1),
              child: Align(
                  alignment: change.isChange.value == true
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    "48".tr,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: AppColors.blackNumberFourBlackMode,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )),
            ),
            Visibility(
                visible: controller.isHaveAccount.value == 2,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.07,
                      right: screenWidth * 0.1,
                      left: screenWidth * 0.1),
                  child: Align(
                    alignment: change.isChange.value == true
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: GetX<HomeController>(
                        builder: (controllerss) => Text(
                              "${controllerss.nameUserFromDataBase.value.toString()}",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.blackNumberFourBlackMode,
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                  ),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.135, right: screenWidth * 0.1),
                child: InkWell(
                  onTap: () {
                    if (controller.isHaveAccount.value == 1) {
                      controller.LogInAuth.value = true;
                    } else {
                      controller.WearningAboutAccountTheUserHave.value = true;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(5)),
                    width: screenWidth * 0.35,
                    height: screenHeight / 20,
                    child: Center(
                        child: Text(
                      "49".tr,
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.135, left: screenWidth * 0.1),
                child: InkWell(
                  onTap: () {
                    if (controller.isHaveAccount.value == 1) {
                      controller.SignUpAuth.value = true;
                    } else {
                      controller.WearningAboutAccountTheUserHave.value = true;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(5)),
                    width: screenWidth * 0.35,
                    height: screenHeight / 20,
                    child: Center(
                        child: Text(
                      "50".tr,
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
            ////The Info///////

            Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.22, right: screenWidth * 0.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: screenWidth,
                        height: screenHeight / 1.5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {
                                      controller.infoAboutTheAccount.value =
                                          true;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.iconInfo}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "51".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.23
                                            : screenWidth * 0.29,
                                      ),
                                      Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {
                                      controller.OrderList.value = true;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.iconOrder}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "52".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.43
                                            : screenWidth * 0.48,
                                      ),
                                      Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {
                                      controller.infoAboutAddress.value = true;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.addressIcon}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "53".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.4
                                            : screenWidth * 0.485,
                                      ),
                                      Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {
                                      controller.TheShoppingCartList.value =
                                          true;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.CartIcon}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "54".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.3
                                            : screenWidth * 0.39,
                                      ),
                                      Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {}
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.aboutusIcon}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "55".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.44
                                            : screenWidth * 0.38,
                                      ),
                                      Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "56".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color:
                                            AppColors.blackNumberFourBlackMode,
                                        fontSize: screenWidth * 0.050,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          controller.thelanguageList.value =
                                              true;
                                        },
                                        child: Image.asset(
                                          "${ImagesPath.changeLang}",
                                          width: screenWidth * 0.05,
                                        )),
                                    SizedBox(
                                      width: screenWidth * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.thelanguageList.value = true;
                                      },
                                      child: Text(
                                        "58".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.047,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: change.isChange.value == true
                                          ? screenWidth * 0.06
                                          : screenWidth * 0.25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.thelanguageList.value = true;
                                      },
                                      child: Text(
                                        "57".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.040,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: change.isChange.value == true
                                          ? screenWidth * 0.01
                                          : screenWidth * 0.03,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.thelanguageList.value = true;
                                      },
                                      child: Image.asset(
                                        change.isChange.value == true
                                            ? "${ImagesPath.iconArrowEn}"
                                            : "${ImagesPath.arrowIconLeft}",
                                        width: screenWidth * 0.06,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    controller.changeTheCountry.value = true;
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      if (controller.isHaveAccount.value == 1) {
                                        controller.isNotHaveAnyAccount.value =
                                            true;
                                      } else {
                                        controller.changeTheCountry.value =
                                            true;
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "${ImagesPath.changeCountry}",
                                          width: screenWidth * 0.05,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.02,
                                        ),
                                        Text(
                                          "59".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.047,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: change.isChange.value == true
                                              ? screenWidth * 0.18
                                              : screenWidth * 0.30,
                                        ),
                                        Image.asset(
                                          controller.whatIsChoesAboutTheCountry
                                                      .value ==
                                                  1
                                              ? "${ImagesPath.SaFlagIcon}"
                                              : controller.whatIsChoesAboutTheCountry
                                                          .value ==
                                                      2
                                                  ? "${ImagesPath.KwFlagIcon}"
                                                  : controller.whatIsChoesAboutTheCountry
                                                              .value ==
                                                          3
                                                      ? "${ImagesPath.BaFlagIcon}"
                                                      : controller.whatIsChoesAboutTheCountry
                                                                  .value ==
                                                              4
                                                          ? "${ImagesPath.omFlagIcon}"
                                                          : controller.whatIsChoesAboutTheCountry
                                                                      .value ==
                                                                  5
                                                              ? "${ImagesPath.IqFlagIcon}"
                                                              : controller.whatIsChoesAboutTheCountry
                                                                          .value ==
                                                                      6
                                                                  ? "${ImagesPath.UaFlagIcon}"
                                                                  : controller.whatIsChoesAboutTheCountry
                                                                              .value ==
                                                                          7
                                                                      ? "${ImagesPath.qrFlagIcon}"
                                                                      : controller.whatIsChoesAboutTheCountry.value ==
                                                                              8
                                                                          ? "${ImagesPath.joFlagIcon}"
                                                                          : "${ImagesPath.SaFlagIcon}",
                                          width: screenWidth * 0.08,
                                        ),
                                        SizedBox(
                                            width: change.isChange.value == true
                                                ? screenWidth * 0.01
                                                : screenWidth * 0.03),
                                        Image.asset(
                                          change.isChange.value == true
                                              ? "${ImagesPath.iconArrowEn}"
                                              : "${ImagesPath.arrowIconLeft}",
                                          width: screenWidth * 0.06,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {}
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.coins}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        "273".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors
                                                .blackNumberFourBlackMode,
                                            fontSize: screenWidth * 0.047,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          width: change.isChange.value == true
                                              ? screenWidth * 0.21
                                              : screenWidth * 0.27),
                                      InkWell(
                                        onTap: () {
                                          controller.theListOFCoins.value =
                                              true;
                                        },
                                        child: Text(
                                          "${controller.theNameOfCoins.value}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.040,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.01
                                            : screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.theListOFCoins.value =
                                                true;
                                          },
                                          child: Image.asset(
                                            change.isChange.value == true
                                                ? "${ImagesPath.iconArrowEn}"
                                                : "${ImagesPath.arrowIconLeft}",
                                            width: screenWidth * 0.06,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {}
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.manageControllerIcon}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (controller
                                                  .isHaveRightAccess.value ==
                                              1) {
                                            controller.WearningAboutAccessRight
                                                .value = true;
                                          } else if (controller
                                                  .isHaveRightAccess.value ==
                                              2) {
                                            Get.to(
                                                ManageTheProductsByTheUser());
                                          }
                                        },
                                        child: Text(
                                          "274".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.047,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                          width: change.isChange.value == true
                                              ? screenWidth * 0.16
                                              : screenWidth * 0.17),
                                      InkWell(
                                        onTap: () {
                                          if (controller
                                                  .isHaveRightAccess.value ==
                                              1) {
                                            controller.WearningAboutAccessRight
                                                .value = true;
                                          } else if (controller
                                                  .isHaveRightAccess.value ==
                                              2) {
                                            Get.to(
                                                ManageTheProductsByTheUser());
                                          }
                                        },
                                        child: Image.asset(
                                          "${ImagesPath.manageController}",
                                          width: screenWidth * 0.085,
                                        ),
                                      ),
                                      SizedBox(
                                        width: change.isChange.value == true
                                            ? screenWidth * 0.01
                                            : screenWidth * 0.03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            if (controller
                                                    .isHaveRightAccess.value ==
                                                1) {
                                              controller
                                                  .WearningAboutAccessRight
                                                  .value = true;
                                            } else if (controller
                                                    .isHaveRightAccess.value ==
                                                2) {
                                              Get.to(
                                                  ManageTheProductsByTheUser());
                                            }
                                          },
                                          child: Image.asset(
                                            change.isChange.value == true
                                                ? "${ImagesPath.iconArrowEn}"
                                                : "${ImagesPath.arrowIconLeft}",
                                            width: screenWidth * 0.06,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Stack(children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.isHaveAccount.value == 1) {
                                      controller.isNotHaveAnyAccount.value =
                                          true;
                                    } else {
                                      controller.logout();
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.logout}",
                                        width: screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "275".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.047,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                          width: change.isChange.value == true
                                              ? screenWidth * 0.42
                                              : screenWidth * 0.36),
                                      InkWell(
                                          onTap: () {
                                            if (controller
                                                    .isHaveRightAccess.value ==
                                                1) {
                                              controller
                                                  .WearningAboutAccessRight
                                                  .value = true;
                                            } else if (controller
                                                    .isHaveRightAccess.value ==
                                                2) {
                                              Get.to(
                                                  ManageTheProductsByTheUser());
                                            }
                                          },
                                          child: Image.asset(
                                            change.isChange.value == true
                                                ? "${ImagesPath.iconArrowEn}"
                                                : "${ImagesPath.arrowIconLeft}",
                                            width: screenWidth * 0.06,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: screenHeight * 0.05,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.0002,
                                        color: AppColors.balckgray,
                                      )),
                                ),
                              ]),
                            ],
                          ),
                        )),
                  ),

                  ///////////////////Order//////////////////
                )),

            //////////////////////////////The Country /////////////
            //////////////////////////The user Have Account ////////////////////////////////////
            Visibility(
                visible: controller.WearningAboutAccountTheUserHave.value,
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
                            controller.WearningAboutAccountTheUserHave.value =
                                false;
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
                          padding: EdgeInsets.only(top: screenHeight * 0.01),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Lottie.asset("${ImagesPath.warning}",
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
                                  "62".tr,
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

            //////////////////////////////The Access Right //////////////////////////////
            Visibility(
                visible: controller.WearningAboutAccessRight.value,
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
                            controller.WearningAboutAccessRight.value = false;
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
                          padding: EdgeInsets.only(top: screenHeight * 0.01),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Lottie.asset("${ImagesPath.warning}",
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
                                  "276".tr,
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

            ///////////////////////////////////////
            Menu(),
            //////////////////////The no Account/////////////
            ///////////////////////The user Have Account ////////////////////////////////////
            Visibility(
                visible: controller.isNotHaveAnyAccount.value,
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
                            controller.isNotHaveAnyAccount.value = false;
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
                          padding: EdgeInsets.only(top: screenHeight * 0.01),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Lottie.asset("${ImagesPath.warning}",
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
                                  "63".tr,
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

            //////////////INFO ACCOUNT///////////

            Visibility(
                visible: controller.infoAboutTheAccount.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.infoAboutTheAccount.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.infoAboutTheAccount.value,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.32,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.infoAboutTheAccount.value = false;
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
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "64".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors
                                              .blackNumberFourBlackMode,
                                          fontSize: screenWidth * 0.047,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "65".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.01,
                                        ),
                                        Text(
                                          "${controller.nameUserFromDataBase.value}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "66".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.01,
                                        ),
                                        Text(
                                          "${controller.emailUserFromDataBase.value}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "67".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.01,
                                        ),
                                        Text(
                                          "${controller.phoneFromDataBase.value}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "71".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.01,
                                        ),
                                        Text(
                                          controller.is_write_address.value == 1
                                              ? "68".tr
                                              : controller.is_write_address
                                                          .value ==
                                                      2
                                                  ? "69".tr
                                                  : "70".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: controller.is_write_address
                                                          .value ==
                                                      1
                                                  ? AppColors.WelcomeRed
                                                  : Colors.green[400],
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ]),
                  ),
                )),
            //////////////////////////

            //////////////INFO Address///////////

            Visibility(
                visible: controller.infoAboutAddress.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.infoAboutAddress.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.infoAboutAddress.value,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.65,
                    decoration: BoxDecoration(
                        color: AppColors.theMainColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.infoAboutAddress.value = false;
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
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      "71.1".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors.WelcomeRed,
                                          fontSize: screenWidth * 0.055,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Visibility(
                                        visible:
                                            controller.is_write_address.value ==
                                                2,
                                        child: Text(
                                          "224".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        )),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Visibility(
                                        visible:
                                            controller.is_write_address.value ==
                                                2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "225".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.054,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.01,
                                            ),
                                            Text(
                                              "${controller.theResidenceArea.value}",
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Visibility(
                                        visible:
                                            controller.is_write_address.value ==
                                                2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "226".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.054,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Text(
                                              "${controller.Street.value}",
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                    Visibility(
                                        visible:
                                            controller.is_write_address.value ==
                                                2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "227".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.054,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Text(
                                              "${controller.HomeNumber.value}",
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.050,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Visibility(
                        visible: controller.is_write_address.value == 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.12),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "72".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: AppColors.blackNumberFourBlackMode,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: controller.is_write_address.value == 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Form(
                                  key: controller.addressKey,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.21),
                                      child: Column(
                                        children: [
                                          TextFormFiledCus(
                                            keyboardType: TextInputType.name,
                                            autofillHints: [AutofillHints.name],
                                            obscureText: false,
                                            controllerData:
                                                controller.residence_area,
                                            value: (value) {
                                              controller
                                                      .residence_areaAddToDatabase =
                                                  value.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            onChanged: (val) {
                                              controller
                                                      .residence_areaAddToDatabase =
                                                  val.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "73".tr;
                                              } else {
                                                return null;
                                              }
                                            },
                                            hintData: "74".tr,
                                            iconData: Icons.location_city,
                                            labelData: "74".tr,
                                            fillColor: Colors.white,
                                            iconColor: AppColors
                                                .blackNumberFourBlackMode,
                                            hintColor: AppColors.theMainOfColor,
                                            fontColor: AppColors
                                                .blackNumberFourBlackMode,
                                            borderSideColor: Colors.white,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.03,
                                          ),
                                          TextFormFiledCus(
                                            keyboardType: TextInputType.name,
                                            autofillHints: [AutofillHints.name],
                                            obscureText: false,
                                            controllerData: controller.street,
                                            value: (value) {
                                              controller.streetAddToDatabase =
                                                  value.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            onChanged: (val) {
                                              controller.streetAddToDatabase =
                                                  val.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "75".tr;
                                              } else {
                                                return null;
                                              }
                                            },
                                            hintData: "76".tr,
                                            iconData: Icons.streetview,
                                            labelData: "76".tr,
                                            fillColor: Colors.white,
                                            iconColor: AppColors
                                                .blackNumberFourBlackMode,
                                            hintColor: AppColors.theMainOfColor,
                                            fontColor: AppColors
                                                .blackNumberFourBlackMode,
                                            borderSideColor: Colors.white,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.03,
                                          ),
                                          TextFormFiledCus(
                                            keyboardType: TextInputType.number,
                                            autofillHints: [AutofillHints.name],
                                            obscureText: false,
                                            controllerData:
                                                controller.home_number,
                                            value: (value) {
                                              controller
                                                      .home_numberAddToDatabase =
                                                  value.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            onChanged: (val) {
                                              controller
                                                      .home_numberAddToDatabase =
                                                  val.toString();

                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              return null;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "75".tr;
                                              } else {
                                                return null;
                                              }
                                            },
                                            hintData: "77".tr,
                                            iconData: Icons.home,
                                            labelData: "77".tr,
                                            fillColor: Colors.white,
                                            iconColor: AppColors
                                                .blackNumberFourBlackMode,
                                            hintColor: AppColors.theMainOfColor,
                                            fontColor: AppColors
                                                .blackNumberFourBlackMode,
                                            borderSideColor: Colors.white,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.03,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.addTheAddressTheUser(
                                                  controller
                                                      .residence_areaAddToDatabase
                                                      .toString(),
                                                  controller.streetAddToDatabase
                                                      .toString(),
                                                  controller
                                                      .home_numberAddToDatabase
                                                      .toString());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.WelcomeRed,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: screenWidth * 0.65,
                                              height: screenHeight / 20,
                                              child: Center(
                                                  child: Text(
                                                "79".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.white,
                                                    fontSize:
                                                        screenWidth * 0.048,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              )),
                                            ),
                                          ),
                                        ],
                                      )),
                                )),
                          )),
                      Visibility(
                          visible: controller.is_write_address.value == 1,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.53),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.1),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Visibility(
                                          child: InkWell(
                                        onTap: () {
                                          controller.addTheAddressTheUser(
                                              controller
                                                  .residence_areaAddToDatabase
                                                  .toString(),
                                              controller.streetAddToDatabase
                                                  .toString(),
                                              controller
                                                  .home_numberAddToDatabase
                                                  .toString());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.WelcomeRed,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: screenWidth * 0.55,
                                          height: screenHeight / 20,
                                          child: Center(
                                              child: Text(
                                            "229".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors.white,
                                                fontSize: screenWidth * 0.048,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                      )))))),
                      Visibility(
                          visible: controller.loadingTheAddress.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black26,
                          )),
                      Visibility(
                          visible: controller.loadingTheAddress.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black26,
                          )),
                      Visibility(
                          visible: controller.loadingTheAddress.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black26,
                          )),
                      Visibility(
                          visible: controller.loadingTheAddress.value,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "71.2".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: AppColors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ))),
                      Visibility(
                          visible: controller.loadingTheAddress.value,
                          child: Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.14),
                            child: Align(
                              alignment: Alignment.center,
                              child: Lottie.asset("${ImagesPath.loadingWait}",
                                  width: screenWidth * 0.21),
                            ),
                          )),
                      Visibility(
                          visible: controller.isAddIntoDatabaseTheAddress.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black26,
                          )),
                      Visibility(
                          visible: controller.isAddIntoDatabaseTheAddress.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black38,
                          )),
                      Visibility(
                          visible: controller.isAddIntoDatabaseTheAddress.value,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "71.3".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: AppColors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ))),
                      Visibility(
                          visible: controller.isAddIntoDatabaseTheAddress.value,
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.14),
                            child: Align(
                              alignment: Alignment.center,
                              child: Lottie.asset(
                                  "${ImagesPath.iscreateAccount}",
                                  width: screenWidth * 0.41),
                            ),
                          )),
                      Visibility(
                          visible: controller.isAddIntoDatabaseTheAddress.value,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.07),
                              child: InkWell(
                                onTap: () {
                                  controller.infoAboutAddress.value = false;
                                  controller.isAddIntoDatabaseTheAddress.value =
                                      false;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.circular(10)),
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
                    ]),
                  ),
                )),
            //////////////////////////
            ////////////////////Shopping cart ///////////////////////
            Visibility(
              visible: controller.TheShoppingCartList.value,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.white,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            controller.totalPrice = 0;
                            controller.isAddThetotalPriceToMemory.value = false;
                            controller.TheShoppingCartList.value = false;

                            controller.isAddThetotalPriceToMemory.value = false;
                            controller.indexShoppingCart = 0;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.totalPrice = 0;
                                  controller.isAddThetotalPriceToMemory.value =
                                      false;
                                  controller.TheShoppingCartList.value = false;

                                  controller.isAddThetotalPriceToMemory.value =
                                      false;
                                  controller.indexShoppingCart = 0;
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
                              InkWell(
                                onTap: () {
                                  controller.totalPrice = 0;
                                  controller.isAddThetotalPriceToMemory.value =
                                      false;
                                  controller.TheShoppingCartList.value = false;

                                  controller.isAddThetotalPriceToMemory.value =
                                      false;

                                  controller.indexShoppingCart = 0;
                                },
                                child: Text(
                                  "121".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color:
                                          const Color.fromARGB(255, 47, 47, 47),
                                      fontSize: screenWidth * 0.043,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),

                        Text(
                          "80".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.blackNumberFourBlackMode,
                              fontSize: screenWidth * 0.054,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.70,
                          color: Colors.white,
                          child: FutureBuilder(
                            future: controller.getDataShoppingCart(
                                controller.IDUserFromDataBase.value.toString()),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (controller.isShoppingCartEmpty.value ==
                                  false) {
                                return Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "230".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors
                                              .blackNumberFourBlackMode,
                                          fontSize: screenWidth * 0.054,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    Lottie.asset("${ImagesPath.empty}",
                                        width: screenWidth * 0.4),
                                  ],
                                ));
                              } else if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data['data'].length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      controller.cartShop.namePro =
                                          "${snapshot.data['data'][i]['name_product'].toString()}";
                                      controller.cartShop.nameProEn =
                                          "${snapshot.data['data'][i]['name_product_en'].toString()}";
                                      controller.cartShop.pricePro =
                                          "${snapshot.data['data'][i]['price_product'].toString()}";
                                      controller.cartShop.oldpricePro =
                                          "${snapshot.data['data'][i]['old_price'].toString()}";

                                      controller.cartShop.imagePro =
                                          "${snapshot.data['data'][i]['image_product'].toString()}";

                                      controller.cartShop.totalPrice =
                                          "${snapshot.data['data'][i]['total'].toString()}";

                                      controller.cartShop.quantitysProduct =
                                          "${snapshot.data['data'][i]['quantity'].toString()}";

                                      controller.cartShop.bodyPro =
                                          "${snapshot.data['data'][i]['body_product'].toString()}";

                                      controller.cartShop.bodyProEn = snapshot
                                          .data['data'][i]['body_product_en']
                                          .toString();

                                      controller.cartShop.statusshoppingcart =
                                          snapshot.data['data'][i]
                                                  ['status_shopping_cart']
                                              .toString();

                                      controller.cartShop.idOfOrder = snapshot
                                          .data['data'][i]
                                              ['id_order_shopping_cart']
                                          .toString();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        if (controller
                                                .isAddThetotalPriceToMemory
                                                .value ==
                                            false) {
                                          controller.indexShoppingCart += 1;
                                          setState(() {});
                                          controller.totalPrice += int.parse(
                                              snapshot.data['data'][i]['total']
                                                  .toString());
                                        } else {}

                                        if (controller.indexShoppingCart ==
                                            snapshot.data['data'].length) {
                                          controller.isAddThetotalPriceToMemory
                                              .value = true;
                                        }
                                      });

                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                            bottom: screenHeight * 0.00),
                                        child: InkWell(
                                          onTap: () {},
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 1200),
                                            decoration: BoxDecoration(
                                                color: AppColors.theMainColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: screenWidth,
                                            height: screenHeight * 0.14,
                                            child: Stack(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.00,
                                                            right: screenWidth *
                                                                0.00),
                                                        child:
                                                            CachedNetworkImage(
                                                          width: screenWidth *
                                                              0.24,
                                                          height: screenHeight *
                                                              0.12,
                                                          fit: BoxFit.contain,
                                                          imageUrl:
                                                              ("${controller.cartShop.imagePro}"),
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          placeholder:
                                                              (context, url) =>
                                                                  SizedBox(
                                                            width: 15,
                                                            height: 15,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                AppColors
                                                                    .theMainColor,
                                                              )),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              top:
                                                                  screenHeight *
                                                                      0.03,
                                                              left:
                                                                  screenWidth *
                                                                      0.04,
                                                              right:
                                                                  screenWidth *
                                                                      0.04),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .deleteFromShoppingCart("${snapshot.data['data'][i]['id_shoppingCart'].toString()}");
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: screenWidth *
                                                                            0.19,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.red,
                                                                            borderRadius: BorderRadius.circular(0)),
                                                                        child:
                                                                            Text(
                                                                          "231"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.white,
                                                                              fontSize: screenWidth * 0.040,
                                                                              fontWeight: FontWeight.w400),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          maxLines:
                                                                              3,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      screenHeight *
                                                                          0.02,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      "SAR".tr,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.047,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    SizedBox(
                                                                      width: screenWidth *
                                                                          0.004,
                                                                    ),
                                                                    Text(
                                                                      ("${controller.cartShop.totalPrice}"),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.047,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                    )),
                                                SingleChildScrollView(
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GetX<
                                                                ChangeLanguageToLocale>(
                                                            builder:
                                                                (scontroller) =>
                                                                    scontroller.changeLangData ==
                                                                            1
                                                                        ? Text(
                                                                            ("${controller.cartShop.namePro}"),
                                                                            style: TextStyle(
                                                                                fontFamily: 'Cairo',
                                                                                color: Colors.black,
                                                                                fontSize: screenWidth * 0.042,
                                                                                fontWeight: FontWeight.w700),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            ("${controller.cartShop.nameProEn}"),
                                                                            style: TextStyle(
                                                                                fontFamily: 'Cairo',
                                                                                color: Colors.black,
                                                                                fontSize: screenWidth * 0.042,
                                                                                fontWeight: FontWeight.w700),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            width: screenWidth *
                                                                0.47,
                                                            child: GetX<
                                                                ChangeLanguageToLocale>(
                                                              builder: (scontroller) =>
                                                                  scontroller.changeLangData ==
                                                                          1
                                                                      ? Text(
                                                                          ("${controller.cartShop.bodyPro}"),
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.black,
                                                                              fontSize: screenWidth * 0.042,
                                                                              fontWeight: FontWeight.w400),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        )
                                                                      : Text(
                                                                          ("${controller.cartShop.bodyProEn}"),
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.black,
                                                                              fontSize: screenWidth * 0.042,
                                                                              fontWeight: FontWeight.w400),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                            )),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "82".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.043,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.002,
                                                        ),
                                                        Container(
                                                          width: screenWidth *
                                                              0.04,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0)),
                                                          child: Text(
                                                            "${snapshot.data['data'][i]['quantity_cart'].toString()}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.043,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text("${snapshot.error}"),
                                );
                              } else {
                                return Center(
                                  child: Text("${snapshot.error}"),
                                );
                              }
                            },
                          ),
                        ),

                        SizedBox(
                          height: screenHeight * 0.04,
                        ),

                        InkWell(
                          onTap: () {
                            controller.addToOrder(
                                controller.cartShop.idOfOrder.toString(),
                                controller.totalPrice.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.WelcomeRed,
                                borderRadius: BorderRadius.circular(10)),
                            width: screenWidth * 0.65,
                            height: screenHeight / 20,
                            child: Center(
                                child: Text(
                              "83".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.white,
                                  fontSize: screenWidth * 0.048,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),

                        /////////////

                        ////////////
                      ]),
                    ),
                    Visibility(
                        visible:
                            controller.isLoadingAddIntoTheShoppingCart.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Colors.black26,
                        )),
                    Visibility(
                        visible:
                            controller.isLoadingAddIntoTheShoppingCart.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Colors.black26,
                        )),
                    Visibility(
                        visible:
                            controller.isLoadingAddIntoTheShoppingCart.value,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "131".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.white,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ))),
                    Visibility(
                        visible:
                            controller.isLoadingAddIntoTheShoppingCart.value,
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.14),
                          child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset("${ImagesPath.loadingWait}",
                                width: screenWidth * 0.21),
                          ),
                        )),
                    Visibility(
                        visible:
                            controller.isAddTheShoppingCartIntoTheOrder.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Colors.black26,
                        )),
                    Visibility(
                        visible:
                            controller.isAddTheShoppingCartIntoTheOrder.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Colors.black38,
                        )),
                    Visibility(
                        visible:
                            controller.isAddTheShoppingCartIntoTheOrder.value,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "132".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.white,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ))),
                    Visibility(
                        visible:
                            controller.isAddTheShoppingCartIntoTheOrder.value,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.23),
                          child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset("${ImagesPath.successfully}",
                                width: screenWidth * 0.31),
                          ),
                        )),
                    Visibility(
                        visible:
                            controller.isAddTheShoppingCartIntoTheOrder.value,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.24),
                            child: InkWell(
                              onTap: () {
                                controller.isAddTheShoppingCartIntoTheOrder
                                    .value = false;
                                controller.TheShoppingCartList.value = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                width: screenWidth * 0.56,
                                height: screenHeight / 20,
                                child: Center(
                                    child: Text(
                                  "39".tr,
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
//////////////////////////////// The Coins/////////////////////////////////////////////////////////////////////

            Visibility(
                visible: controller.theListOFCoins.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.theListOFCoins.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.theListOFCoins.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.35,
                        decoration: BoxDecoration(
                            color: AppColors.theMainColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.theListOFCoins.value = false;
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
                            padding: EdgeInsets.only(top: screenHeight * 0.04),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "277".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.060,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "278".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Text(
                                              "${controller.theNameOfCoins.value}",
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.yellow,
                                                  fontSize: screenWidth * 0.048,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                        Text(
                                          "279".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: screenHeight * 0.02),
                                        InkWell(
                                          onTap: () {
                                            controller.theCoins.value = 1;
                                            controller.whatIsTheCoinsOFTheApp();
                                          },
                                          child: Container(
                                            width: screenWidth * 0.32,
                                            height: screenHeight * 0.04,
                                            decoration: BoxDecoration(
                                                color: AppColors.balckgray,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "280".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.041,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.02),
                                        InkWell(
                                          onTap: () {
                                            controller.theCoins.value = 2;
                                            controller.whatIsTheCoinsOFTheApp();
                                          },
                                          child: Container(
                                            width: screenWidth * 0.32,
                                            height: screenHeight * 0.04,
                                            decoration: BoxDecoration(
                                                color: AppColors.balckgray,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "281".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.041,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ])))),

/////////////////////Change The Lang list/////////////////////
            Visibility(
                visible: controller.thelanguageList.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.thelanguageList.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.black26,
                      width: screenWidth,
                      height: screenHeight,
                    ))),
            Visibility(
                visible: controller.thelanguageList.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.35,
                        decoration: BoxDecoration(
                            color: AppColors.theMainColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.thelanguageList.value = false;
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
                            padding: EdgeInsets.only(top: screenHeight * 0.05),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "84".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.060,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.01,
                                        ),
                                        Text(
                                          "85".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors
                                                  .blackNumberFourBlackMode,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            change.changeLang("ar");
                                          },
                                          child: Container(
                                            width: screenWidth * 0.32,
                                            height: screenHeight * 0.04,
                                            decoration: BoxDecoration(
                                                color: AppColors.balckgray,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "86".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.041,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            change.changeLang("en");
                                          },
                                          child: Container(
                                            width: screenWidth * 0.32,
                                            height: screenHeight * 0.04,
                                            decoration: BoxDecoration(
                                                color: AppColors.balckgray,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                "87".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.041,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ])))),

            /////////////////////////////The Order List ....................................................../////////////

            Visibility(
                visible: controller.OrderList.value,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.02,
                                  right: screenWidth * 0.02,
                                  left: screenWidth * 0.02),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            controller.OrderList.value = false;
                                          },
                                          child: GetX<ChangeLanguageToLocale>(
                                            builder: (scontroller) =>
                                                scontroller.changeLangData == 1
                                                    ? Image.asset(
                                                        "${ImagesPath.arrowIconRight}",
                                                        width:
                                                            screenWidth * 0.09,
                                                      )
                                                    : Image.asset(
                                                        "${ImagesPath.arrowIconLeft}",
                                                        width:
                                                            screenWidth * 0.09,
                                                      ),
                                          )),
                                      InkWell(
                                        onTap: () {
                                          controller.OrderList.value = false;
                                        },
                                        child: Text(
                                          "137".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: const Color.fromARGB(
                                                  255, 47, 47, 47),
                                              fontSize: screenWidth * 0.043,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ]),
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "138".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color:
                                            AppColors.blackNumberFourBlackMode,
                                        fontSize: screenWidth * 0.054,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ))),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.03),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * 0.90,
                                color: Colors.white,
                                child: FutureBuilder(
                                  future: controller.getOrderData(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (controller.isOrdersEmpty.value ==
                                        true) {
                                      return Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "230".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.054,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.03,
                                          ),
                                          Lottie.asset("${ImagesPath.empty}",
                                              width: screenWidth * 0.4),
                                        ],
                                      ));
                                    } else if (snapshot.hasData) {
                                      return ListView.builder(
                                          itemCount:
                                              snapshot.data['data'].length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, i) {
                                            controller.theOrder.idorder =
                                                "${snapshot.data['data'][i]['id_order'].toString()}";
                                            controller.theOrder.id_of_order =
                                                "${snapshot.data['data'][i]['id_of_order'].toString()}";
                                            controller.theOrder.total =
                                                "${snapshot.data['data'][i]['total'].toString()}";

                                            controller.theOrder.order_status =
                                                "${snapshot.data['data'][i]['order_status'].toString()}";

                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01,
                                                    bottom:
                                                        screenHeight * 0.00),
                                                child: InkWell(
                                                    onTap: () {},
                                                    child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 1200),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .theMainColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        width: screenWidth,
                                                        height:
                                                            screenHeight * 0.21,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      ("139"
                                                                          .tr),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.042,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    SizedBox(
                                                                      width: screenWidth *
                                                                          0.02,
                                                                    ),
                                                                    Text(
                                                                      ("${controller.theOrder.id_of_order}"),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              33,
                                                                              33,
                                                                              33),
                                                                          fontSize: screenWidth *
                                                                              0.042,
                                                                          fontWeight:
                                                                              FontWeight.w900),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      screenHeight *
                                                                          0.004,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      ("140"
                                                                          .tr),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.042,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    SizedBox(
                                                                      width: screenWidth *
                                                                          0.02,
                                                                    ),
                                                                    Text(
                                                                      "SAR".tr,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.047,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    SizedBox(
                                                                      width: screenWidth *
                                                                          0.004,
                                                                    ),
                                                                    SizedBox(
                                                                      height: screenHeight *
                                                                          0.004,
                                                                    ),
                                                                    Text(
                                                                      ("${controller.theOrder.total}"),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              39,
                                                                              142,
                                                                              42),
                                                                          fontSize: screenWidth *
                                                                              0.047,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      screenHeight *
                                                                          0.004,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      ("141"
                                                                          .tr),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: screenWidth *
                                                                              0.042,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    SizedBox(
                                                                      width: screenWidth *
                                                                          0.02,
                                                                    ),
                                                                    Text(
                                                                      controller.theOrder.order_status ==
                                                                              "1"
                                                                          ? ("142"
                                                                              .tr)
                                                                          : ("143"
                                                                              .tr),
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: controller.theOrder.order_status == "1"
                                                                              ? Colors
                                                                                  .red
                                                                              : Colors
                                                                                  .amber,
                                                                          fontSize: screenWidth *
                                                                              0.047,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      screenHeight *
                                                                          0.02,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    if ("${snapshot.data['data'][i]['order_status'].toString()}" ==
                                                                        "2") {
                                                                      controller
                                                                              .id_of_orderAdd =
                                                                          "${snapshot.data['data'][i]['id_of_order'].toString()}";
                                                                      controller.getCompleteprocessOrder(controller
                                                                          .id_of_orderAdd
                                                                          .toString());
                                                                      controller
                                                                          .OrderCompleteOrdersProcess
                                                                          .value = true;
                                                                    } else {
                                                                      controller
                                                                              .idorderAdd =
                                                                          "${snapshot.data['data'][i]['id_order'].toString()}";

                                                                      controller
                                                                              .id_of_orderAdd =
                                                                          "${snapshot.data['data'][i]['id_of_order'].toString()}";
                                                                      controller
                                                                              .totalAdd =
                                                                          "${snapshot.data['data'][i]['total'].toString()}";
                                                                      controller
                                                                              .order_statusAdd =
                                                                          "${snapshot.data['data'][i]['order_status'].toString()}";
                                                                      controller
                                                                              .how_to_payAdd =
                                                                          "${snapshot.data['data'][i]['how_to_pay'].toString()}";

                                                                      controller
                                                                          .OrderDetails
                                                                          .value = true;
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        screenWidth *
                                                                            0.3,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2)),
                                                                    child: Text(
                                                                      "232".tr,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: screenWidth *
                                                                              0.042,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),
                                                        ))));
                                          });
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child: CircularProgressIndicator(
                                        color: AppColors.WelcomeRed,
                                      ));
                                    } else {
                                      return Center(
                                          child: Center(
                                              child: CircularProgressIndicator(
                                        color: AppColors.WelcomeRed,
                                      )));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      /////////////////////Step Two///////////////////////////////

                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: screenWidth * 0.85,
                                  height: screenHeight * 0.70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    controller
                                                        .OrderCompleteOrdersProcess
                                                        .value = false;
                                                  },
                                                  child: GetX<
                                                      ChangeLanguageToLocale>(
                                                    builder: (scontroller) =>
                                                        scontroller.changeLangData ==
                                                                1
                                                            ? Image.asset(
                                                                "${ImagesPath.arrowIconRight}",
                                                                width:
                                                                    screenWidth *
                                                                        0.09,
                                                              )
                                                            : Image.asset(
                                                                "${ImagesPath.arrowIconLeft}",
                                                                width:
                                                                    screenWidth *
                                                                        0.09,
                                                              ),
                                                  )),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: screenHeight * 0.08,
                                        ),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: InkWell(
                                            onTap: () {
                                              controller.OrderDetails.value =
                                                  false;
                                            },
                                            child: Text(
                                              "233".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: const Color.fromARGB(
                                                      255, 47, 47, 47),
                                                  fontSize: screenWidth * 0.052,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                  controller
                                                      .OrderCompleteOrdersProcess
                                                      .value = false;
                                                },
                                                child: Text(
                                                  "234".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 47, 47, 47),
                                                      fontSize:
                                                          screenWidth * 0.043,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.15,
                                            right: screenWidth * 0.04,
                                            left: screenWidth * 0.04),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "235".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.046,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                "${controller.CompleteProcessIdOfOrder.value}",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.2,
                                            right: screenWidth * 0.04,
                                            left: screenWidth * 0.04),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "236".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.046,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                "SAR",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 54, 157, 57),
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                "${controller.CompleteProcessTotal.value}",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 54, 157, 57),
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.25,
                                            right: screenWidth * 0.04,
                                            left: screenWidth * 0.04),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "237".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.046,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                controller.CompleteProcessHowToPay
                                                            .value ==
                                                        1
                                                    ? "238".tr
                                                    : "239".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.yellow,
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.3,
                                            right: screenWidth * 0.04,
                                            left: screenWidth * 0.04),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "240".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.046,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                controller.CompleteProcessPaymentProcess
                                                            .value ==
                                                        0
                                                    ? "241".tr
                                                    : "242".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.35,
                                            right: screenWidth * 0.04,
                                            left: screenWidth * 0.04),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "243".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.046,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                controller.CompleteProcessDateOfArrival
                                                            .value ==
                                                        "n"
                                                    ? "244".tr
                                                    : "${controller.CompleteProcessDateOfArrival.value}",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: const Color.fromARGB(
                                                        255, 47, 47, 47),
                                                    fontSize:
                                                        screenWidth * 0.049,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.22,
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                            onTap: () {
                                              controller.OrderDetails.value =
                                                  false;
                                            },
                                            child: Text(
                                              "245".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: const Color.fromARGB(
                                                      255, 47, 47, 47),
                                                  fontSize: screenWidth * 0.052,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.11,
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                            onTap: () {
                                              controller.OrderDetails.value =
                                                  false;
                                            },
                                            child: Text(
                                              controller.CompleteProcessHowToPay
                                                          .value ==
                                                      1
                                                  ? "246".tr
                                                  : "247".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.002,
                                                  fontFamily: 'Cairo',
                                                  color: const Color.fromARGB(
                                                      255, 47, 47, 47),
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )),
                                    Visibility(
                                      visible: controller
                                              .CompleteProcessHowToPay.value ==
                                          2,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                            bottom: screenHeight * 0.05,
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: InkWell(
                                              onTap: () {
                                                //////////////////////////////////////////////////////////////////THERE PAY BY PAYPALLLLLLLLLLLLLL////////////////////////////////////////////////////////////////
                                              },
                                              child: Container(
                                                width: screenWidth * 0.4,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  "248".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.042,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ])))),
                      /////////////////////Step Two///////////////////////////////

                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                          visible: controller.OrderCompleteOrdersProcess.value,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: screenWidth * 0.85,
                                  height: screenHeight * 0.70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        width: screenWidth * 0.85,
                                        height: screenHeight * 0.70,
                                        child: Column(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02,
                                                    right: screenWidth * 0.02,
                                                    left: screenWidth * 0.02),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            controller
                                                                .OrderCompleteOrdersProcess
                                                                .value = false;
                                                          },
                                                          child: GetX<
                                                              ChangeLanguageToLocale>(
                                                            builder: (scontroller) =>
                                                                scontroller.changeLangData ==
                                                                        1
                                                                    ? Image
                                                                        .asset(
                                                                        "${ImagesPath.arrowIconRight}",
                                                                        width: screenWidth *
                                                                            0.09,
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "${ImagesPath.arrowIconLeft}",
                                                                        width: screenWidth *
                                                                            0.09,
                                                                      ),
                                                          )),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .OrderDetails
                                                              .value = false;
                                                        },
                                                        child: Text(
                                                          "233".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  47, 47, 47),
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.052,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Text(
                                              "234".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: const Color.fromARGB(
                                                      255, 47, 47, 47),
                                                  fontSize: screenWidth * 0.043,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenWidth * 0.04,
                                                    right: screenWidth * 0.04,
                                                    left: screenWidth * 0.04),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "235".tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 47, 47, 47),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.046,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth * 0.01,
                                                    ),
                                                    Text(
                                                      "${controller.CompleteProcessIdOfOrder.value}",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 47, 47, 47),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.049,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01,
                                                    right: screenWidth * 0.04,
                                                    left: screenWidth * 0.04),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "236".tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 47, 47, 47),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.046,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth * 0.01,
                                                    ),
                                                    Text(
                                                      "SAR",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 54, 157, 57),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.049,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth * 0.01,
                                                    ),
                                                    Text(
                                                      "${controller.CompleteProcessTotal.value}",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 54, 157, 57),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.049,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02,
                                                    right: screenWidth * 0.04,
                                                    left: screenWidth * 0.04),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "237".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: const Color
                                                                .fromARGB(255,
                                                                47, 47, 47),
                                                            fontSize:
                                                                screenWidth *
                                                                    0.046,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.01,
                                                      ),
                                                      Text(
                                                        controller.CompleteProcessHowToPay
                                                                    .value ==
                                                                1
                                                            ? "238".tr
                                                            : "239".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: AppColors
                                                                .yellow,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.049,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02,
                                                    right: screenWidth * 0.04,
                                                    left: screenWidth * 0.04),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "240".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: const Color
                                                                .fromARGB(255,
                                                                47, 47, 47),
                                                            fontSize:
                                                                screenWidth *
                                                                    0.046,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.01,
                                                      ),
                                                      Text(
                                                        controller.CompleteProcessPaymentProcess
                                                                    .value ==
                                                                0
                                                            ? "241".tr
                                                            : "242".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: const Color
                                                                .fromARGB(255,
                                                                47, 47, 47),
                                                            fontSize:
                                                                screenWidth *
                                                                    0.049,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02,
                                                    right: screenWidth * 0.04,
                                                    left: screenWidth * 0.04),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "243".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: const Color
                                                                .fromARGB(255,
                                                                47, 47, 47),
                                                            fontSize:
                                                                screenWidth *
                                                                    0.046,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.01,
                                                      ),
                                                      Text(
                                                        controller.CompleteProcessDateOfArrival
                                                                    .value ==
                                                                "n"
                                                            ? "244".tr
                                                            : "${controller.CompleteProcessDateOfArrival.value}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: const Color
                                                                .fromARGB(255,
                                                                47, 47, 47),
                                                            fontSize:
                                                                screenWidth *
                                                                    0.049,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: screenHeight * 0.02,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.OrderDetails
                                                          .value = false;
                                                    },
                                                    child: Text(
                                                      "245".tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 47, 47, 47),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.052,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: screenHeight * 0.02,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.OrderDetails
                                                          .value = false;
                                                    },
                                                    child: Text(
                                                      controller.CompleteProcessHowToPay
                                                                  .value ==
                                                              1
                                                          ? "246".tr
                                                          : "247".tr,
                                                      style: TextStyle(
                                                          height: screenHeight *
                                                              0.002,
                                                          fontFamily: 'Cairo',
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 47, 47, 47),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.042,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )),
                                            Visibility(
                                              visible: controller
                                                      .CompleteProcessHowToPay
                                                      .value ==
                                                  2,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: InkWell(
                                                      onTap: () {
                                                        //////////////////////////////////////////////////////////////////THERE PAY BY PAYPALLLLLLLLLLLLLL////////////////////////////////////////////////////////////////
                                                      },
                                                      child: Container(
                                                        width:
                                                            screenWidth * 0.4,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                          "248".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.042,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])))),
                      ///////////////////Step One ///////////////////////////////
                      ///////////////////Step One ///////////////////////////////
                      Visibility(
                          visible: controller.OrderDetails.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                          visible: controller.OrderDetails.value,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.black12,
                          )),
                      Visibility(
                        visible: controller.OrderDetails.value,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.80,
                            height: screenHeight * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.12,
                                        right: screenWidth * 0.02,
                                        left: screenWidth * 0.02),
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.OrderInfo
                                                          .value = true;
                                                      controller.OrderAddress
                                                          .value = false;
                                                      controller.OrderProcess
                                                          .value = false;
                                                    },
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      width: controller
                                                              .OrderInfo.value
                                                          ? screenWidth * 0.33
                                                          : screenWidth * 0.3,
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                  .OrderInfo
                                                                  .value
                                                              ? Colors
                                                                  .green[300]
                                                              : Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                      child: Text(
                                                        "251".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.white,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.043,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: screenWidth * 0.03,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.OrderInfo
                                                          .value = false;
                                                      controller.OrderAddress
                                                          .value = true;
                                                      controller.OrderProcess
                                                          .value = false;
                                                    },
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      width: controller
                                                              .OrderAddress
                                                              .value
                                                          ? screenWidth * 0.33
                                                          : screenWidth * 0.3,
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                  .OrderAddress
                                                                  .value
                                                              ? Colors
                                                                  .green[300]
                                                              : Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                      child: Text(
                                                        "252".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.white,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.043,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: screenWidth * 0.03,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.OrderInfo
                                                          .value = false;
                                                      controller.OrderAddress
                                                          .value = false;
                                                      controller.OrderProcess
                                                          .value = true;
                                                    },
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      width: controller
                                                              .OrderProcess
                                                              .value
                                                          ? screenWidth * 0.33
                                                          : screenWidth * 0.3,
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                  .OrderProcess
                                                                  .value
                                                              ? Colors
                                                                  .green[300]
                                                              : Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                      child: Text(
                                                        "253".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.white,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.043,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: screenWidth * 0.03,
                                              )
                                            ],
                                          ),
                                        ])),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            right: screenWidth * 0.02,
                                            left: screenWidth * 0.02),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      controller.OrderDetails
                                                          .value = false;
                                                    },
                                                    child: GetX<
                                                        ChangeLanguageToLocale>(
                                                      builder: (scontroller) =>
                                                          scontroller.changeLangData ==
                                                                  1
                                                              ? Image.asset(
                                                                  "${ImagesPath.arrowIconRight}",
                                                                  width:
                                                                      screenWidth *
                                                                          0.09,
                                                                )
                                                              : Image.asset(
                                                                  "${ImagesPath.arrowIconLeft}",
                                                                  width:
                                                                      screenWidth *
                                                                          0.09,
                                                                ),
                                                    )),
                                                InkWell(
                                                  onTap: () {
                                                    controller.OrderDetails
                                                        .value = false;
                                                  },
                                                  child: Text(
                                                    "249".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 47, 47, 47),
                                                        fontSize:
                                                            screenWidth * 0.043,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Text(
                                      "250".tr,
                                      style: TextStyle(
                                          height: screenHeight * 0.002,
                                          fontFamily: 'Cairo',
                                          color: const Color.fromARGB(
                                              255, 47, 47, 47),
                                          fontSize: screenWidth * 0.047,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                              /////////////////////////////////////////Process info /////////////////////////////////////
                              Visibility(
                                visible: controller.OrderProcess.value,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.21),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(
                                                "254".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.002,
                                                    fontFamily: 'Cairo',
                                                    color: AppColors
                                                        .blackNumberFourBlackMode,
                                                    fontSize:
                                                        screenWidth * 0.055,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.00,
                                              ),
                                              Text(
                                                "255".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors
                                                        .blackNumberFourBlackMode,
                                                    fontSize:
                                                        screenWidth * 0.050,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                             
                                              SizedBox(
                                                  height: screenHeight * 0.02),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        PaypalCheckout(
                                                      sandboxMode: true,
                                                      clientId:
                                                          "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                                                      secretKey:
                                                          "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                                                      returnURL:
                                                          "success.snippetcoder.com",
                                                      cancelURL:
                                                          "cancel.snippetcoder.com",
                                                      transactions: [
                                                        {
                                                          "amount": {
                                                            "total":
                                                                '${int.parse(controller.totalAdd.toString())}',
                                                            "currency": "USD",
                                                            "details": {
                                                              "subtotal":
                                                                  '${int.parse(controller.totalAdd.toString())}',
                                                              "shipping": '0',
                                                              "shipping_discount":
                                                                  0
                                                            }
                                                          },
                                                          "description":
                                                              "the number of order is 887987987 ",
                                                          // "payment_options": {
                                                          //   "allowed_payment_method":
                                                          //       "INSTANT_FUNDING_SOURCE"
                                                          // },
                                                          /*  "item_list": {
                                                    "items": [
                                                      {
                                                        "name": "Apple",
                                                        "quantity": 4,
                                                        "price":
                                                            '${int.parse(controller.total.value)}',
                                                        "currency": "USD"
                                                      },
                                                    ],
                  
                                                    // shipping address is not required though
                                                    //   "shipping_address": {
                                                    //     "recipient_name": "Raman Singh",
                                                    //     "line1": "Delhi",
                                                    //     "line2": "",
                                                    //     "city": "Delhi",
                                                    //     "country_code": "IN",
                                                    //     "postal_code": "11001",
                                                    //     "phone": "+00000000",
                                                    //     "state": "Texas"
                                                    //  },
                                                  }*/
                                                        }
                                                      ],
                                                      note:
                                                          "Contact us for any questions on your order.",
                                                      onSuccess:
                                                          (Map params) async {
                                                        print(
                                                            "onSuccess: $params");
                                                      },
                                                      onError: (error) {
                                                        print(
                                                            "onError: $error");
                                                        Navigator.pop(context);
                                                      },
                                                      onCancel: () {
                                                        print('cancelled:');
                                                      },
                                                    ),
                                                  ));
                                                  controller.howtoPay.value = 2;
                                                },
                                                child: AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  width: controller
                                                              .howtoPay.value ==
                                                          2
                                                      ? screenWidth * 0.3
                                                      : screenWidth * 0.27,
                                                  decoration: BoxDecoration(
                                                      color: controller.howtoPay
                                                                  .value ==
                                                              2
                                                          ? Colors.amber
                                                          : Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "257".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.044,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.02),
                                              InkWell(
                                                onTap: () {
                                                  controller.howtoPay.value = 3;
                                                },
                                                child: AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  width: controller
                                                              .howtoPay.value ==
                                                          3
                                                      ? screenWidth * 0.3
                                                      : screenWidth * 0.27,
                                                  decoration: BoxDecoration(
                                                      color: controller.howtoPay
                                                                  .value ==
                                                              3
                                                          ? Colors.amber
                                                          : Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "256".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.044,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.17),
                                              Visibility(
                                                  visible: controller
                                                          .OrderProcess.value &&
                                                      controller
                                                              .howtoPay.value !=
                                                          0 &&
                                                      controller
                                                              .is_write_address
                                                              .value ==
                                                          2,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller
                                                          .makeTheOrderIsConfim(
                                                              controller
                                                                  .idorderAdd
                                                                  .toString(),
                                                              int.parse(controller
                                                                  .howtoPay
                                                                  .value
                                                                  .toString()));

                                                      controller
                                                          .addIntoCompleteprocessOrder(
                                                              controller
                                                                  .idorderAdd
                                                                  .toString(),
                                                              controller
                                                                  .id_of_orderAdd
                                                                  .toString(),
                                                              controller
                                                                  .totalAdd
                                                                  .toString(),
                                                              controller
                                                                  .howtoPay
                                                                  .value
                                                                  .toString());
                                                    },
                                                    child: AnimatedContainer(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      width: screenWidth * 0.5,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .WelcomeRed,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        "260".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.white,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.049,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),

                              Visibility(
                                visible:
                                    controller.is_write_address.value == 1 &&
                                        controller.OrderProcess.value,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.22),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.08),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "258".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.WelcomeRed,
                                              fontSize: screenWidth * 0.044,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ),
                              Visibility(
                                visible: controller.OrderProcess.value &&
                                    controller.howtoPay.value == 0,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.38),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.08),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "259".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.WelcomeRed,
                                              fontSize: screenWidth * 0.044,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ),

                              ///////////////////////////////// //////////////////Adress Info///////////////////////////////////
                              Visibility(
                                visible:
                                    controller.is_write_address.value == 2 &&
                                        controller.OrderAddress.value,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.23),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(
                                                "261".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors
                                                        .blackNumberFourBlackMode,
                                                    fontSize:
                                                        screenWidth * 0.055,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "262".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.054,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.01,
                                                  ),
                                                  Text(
                                                    "${controller.theResidenceArea.value}",
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.050,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "264".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.054,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.01,
                                                  ),
                                                  Text(
                                                    "${controller.Street.value}",
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.050,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "265".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.054,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.01,
                                                  ),
                                                  Text(
                                                    "${controller.HomeNumber.value}",
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .blackNumberFourBlackMode,
                                                        fontSize:
                                                            screenWidth * 0.050,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),

                              Visibility(
                                visible:
                                    controller.is_write_address.value == 1 &&
                                        controller.OrderAddress.value,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.18),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.08),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "263".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.WelcomeRed,
                                              fontSize: screenWidth * 0.044,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ),

                              /////////////////////////////////////////Order Info//////////////////////////////////////

                              Visibility(
                                  visible: controller.OrderInfo.value,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenHeight * 0.21,
                                                  right: screenWidth * 0.06,
                                                  left: screenWidth * 0.06),
                                              child: Text(
                                                ("268".tr),
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.05,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                    ],
                                  )),
                              Visibility(
                                  visible: controller.OrderInfo.value,
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenHeight * 0.255,
                                                  right: screenWidth * 0.06,
                                                  left: screenWidth * 0.06),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          ("139".tr),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.02,
                                                        ),
                                                        Text(
                                                          ("${controller.id_of_orderAdd}"),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      33,
                                                                      33,
                                                                      33),
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.042,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          ("140".tr),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.02,
                                                        ),
                                                        Text(
                                                          "SAR".tr,
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
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.004,
                                                        ),
                                                        Text(
                                                          ("${controller.totalAdd}"),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      39,
                                                                      142,
                                                                      42),
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.047,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          ("141".tr),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.02,
                                                        ),
                                                        Text(
                                                          controller.order_statusAdd ==
                                                                  "1"
                                                              ? ("142".tr)
                                                              : ("143".tr),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: controller
                                                                          .order_statusAdd ==
                                                                      "1"
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .amber,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.047,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.14,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .OrderInfoShoppingCart
                                                            .value = true;
                                                      },
                                                      child: Container(
                                                        width:
                                                            screenWidth * 0.6,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2)),
                                                        child: Text(
                                                          "269".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.043,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))))),

                              Visibility(
                                  visible:
                                      controller.OrderInfoShoppingCart.value,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          width: screenWidth,
                                          height: screenHeight,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            screenHeight * 0.02,
                                                        right:
                                                            screenWidth * 0.02,
                                                        left:
                                                            screenWidth * 0.02),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .OrderInfoShoppingCart
                                                                    .value = false;
                                                              },
                                                              child: GetX<
                                                                  ChangeLanguageToLocale>(
                                                                builder: (scontroller) =>
                                                                    scontroller.changeLangData ==
                                                                            1
                                                                        ? Image
                                                                            .asset(
                                                                            "${ImagesPath.arrowIconRight}",
                                                                            width:
                                                                                screenWidth * 0.09,
                                                                          )
                                                                        : Image
                                                                            .asset(
                                                                            "${ImagesPath.arrowIconLeft}",
                                                                            width:
                                                                                screenWidth * 0.09,
                                                                          ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .OrderInfoShoppingCart
                                                                    .value = false;
                                                              },
                                                              child: Text(
                                                                "271".tr,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        47,
                                                                        47,
                                                                        47),
                                                                    fontSize:
                                                                        screenWidth *
                                                                            0.043,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ))),
                                                Text(
                                                  "272".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .blackNumberFourBlackMode,
                                                      fontSize:
                                                          screenWidth * 0.054,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                                Container(
                                                  width: screenWidth,
                                                  height: screenHeight / 2.2,
                                                  color: Colors.white,
                                                  child: FutureBuilder(
                                                    future: controller
                                                        .getShoppingCartOrder(
                                                            controller
                                                                .id_of_orderAdd
                                                                .toString()),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                      if (snapshot.hasData) {
                                                        return ListView.builder(
                                                            itemCount: snapshot
                                                                .data['data']
                                                                .length,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context, i) {
                                                              controller
                                                                      .cartShop
                                                                      .namePro =
                                                                  "${snapshot.data['data'][i]['name_product'].toString()}";
                                                              controller
                                                                      .cartShop
                                                                      .nameProEn =
                                                                  "${snapshot.data['data'][i]['name_product_en'].toString()}";
                                                              controller
                                                                      .cartShop
                                                                      .pricePro =
                                                                  "${snapshot.data['data'][i]['price_product'].toString()}";
                                                              controller
                                                                      .cartShop
                                                                      .oldpricePro =
                                                                  "${snapshot.data['data'][i]['old_price'].toString()}";

                                                              controller
                                                                      .cartShop
                                                                      .imagePro =
                                                                  "${snapshot.data['data'][i]['image_product'].toString()}";

                                                              controller
                                                                      .cartShop
                                                                      .totalPrice =
                                                                  "${snapshot.data['data'][i]['total'].toString()}";

                                                              controller
                                                                      .cartShop
                                                                      .quantitysProduct =
                                                                  "${snapshot.data['data'][i]['quantity'].toString()}";

                                                              controller
                                                                      .cartShop
                                                                      .bodyPro =
                                                                  "${snapshot.data['data'][i]['body_product'].toString()}";

                                                              controller
                                                                      .cartShop
                                                                      .bodyProEn =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'body_product_en']
                                                                      .toString();

                                                              controller
                                                                      .cartShop
                                                                      .statusshoppingcart =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'status_shopping_cart']
                                                                      .toString();

                                                              controller
                                                                      .cartShop
                                                                      .idOfOrder =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_order_shopping_cart']
                                                                      .toString();

                                                              controller
                                                                      .totalPrice +=
                                                                  int.parse(snapshot
                                                                      .data[
                                                                          'data']
                                                                          [i][
                                                                          'total']
                                                                      .toString());
                                                              return Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: screenHeight *
                                                                        0.01,
                                                                    bottom:
                                                                        screenHeight *
                                                                            0.00),
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1200),
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .theMainColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(0)),
                                                                    width:
                                                                        screenWidth,
                                                                    height:
                                                                        screenHeight *
                                                                            0.12,
                                                                    child: Stack(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.01),
                                                                                child: CachedNetworkImage(
                                                                                  width: screenWidth * 0.17,
                                                                                  height: screenHeight,
                                                                                  fit: BoxFit.cover,
                                                                                  imageUrl: ("${controller.cartShop.imagePro}"),
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
                                                                                        AppColors.theMainColor,
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Align(
                                                                                        alignment: Alignment.topRight,
                                                                                        child: Container(
                                                                                            child: Padding(
                                                                                          padding: EdgeInsets.only(top: screenHeight * 0.02, right: screenWidth * 0.04, left: screenWidth * 0.04),
                                                                                          child: GetX<ChangeLanguageToLocale>(
                                                                                              builder: (scontroller) => scontroller.changeLangData == 1
                                                                                                  ? Text(
                                                                                                      ("${controller.cartShop.namePro}"),
                                                                                                      style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.037, fontWeight: FontWeight.w700),
                                                                                                      textAlign: TextAlign.center,
                                                                                                    )
                                                                                                  : Text(
                                                                                                      ("${controller.cartShop.nameProEn}"),
                                                                                                      style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.037, fontWeight: FontWeight.w700),
                                                                                                      textAlign: TextAlign.center,
                                                                                                    )),
                                                                                        ))),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      child: Padding(
                                                                                          padding: EdgeInsets.only(top: screenHeight * 0.0, right: screenWidth * 0.07, left: screenWidth * 0.07),
                                                                                          child: Container(
                                                                                              width: screenWidth * 0.4,
                                                                                              child: GetX<ChangeLanguageToLocale>(
                                                                                                builder: (scontroller) => scontroller.changeLangData == 1
                                                                                                    ? Text(
                                                                                                        ("${controller.cartShop.bodyPro}"),
                                                                                                        style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.038, fontWeight: FontWeight.w400),
                                                                                                        maxLines: 1,
                                                                                                        textAlign: TextAlign.center,
                                                                                                      )
                                                                                                    : Text(
                                                                                                        ("${controller.cartShop.bodyProEn}"),
                                                                                                        style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.038, fontWeight: FontWeight.w400),
                                                                                                        maxLines: 1,
                                                                                                        textAlign: TextAlign.center,
                                                                                                      ),
                                                                                              ))),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      "82".tr,
                                                                                      style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.043, fontWeight: FontWeight.w500),
                                                                                      textAlign: TextAlign.center,
                                                                                      maxLines: 3,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: screenWidth * 0.002,
                                                                                    ),
                                                                                    Container(
                                                                                      width: screenWidth * 0.04,
                                                                                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(0)),
                                                                                      child: Text(
                                                                                        "${snapshot.data['data'][i]['quantity_cart'].toString()}",
                                                                                        style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: screenWidth * 0.043, fontWeight: FontWeight.w500),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                              alignment: Alignment.bottomLeft,
                                                                              child: Container(
                                                                                child: Padding(
                                                                                    padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.04, right: screenWidth * 0.04),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          "SAR".tr,
                                                                                          style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.047, fontWeight: FontWeight.w500),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 3,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: screenWidth * 0.004,
                                                                                        ),
                                                                                        Text(
                                                                                          ("${controller.cartShop.totalPrice}"),
                                                                                          style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.047, fontWeight: FontWeight.w700),
                                                                                          textAlign: TextAlign.center,
                                                                                          maxLines: 3,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                              )),
                                                                        ]),
                                                                  ),
                                                                ),
                                                              );
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
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )))),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),

            ///////////////////////////
            ChangeCountry(), Auth(),

            //////////////////////////
          ],
        ),
      ),
    )));
  }
}
