import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/constant/appcolors.dart';
import 'package:nara_test/views/widgets/manage_the_products/edit_product.dart';
import 'package:nara_test/views/widgets/manage_the_products/the_products_widget.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/localization/changelanguage.dart';

class ManageOptions extends StatelessWidget {
  const ManageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.ManageThePageProductsUers.value,
            child: Scaffold(
              body: SafeArea(
                  child: Stack(
                children: [
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
                                controller.ManageThePageProductsUers.value =
                                    false;
                                controller.isHaveUsersProducts.value = false;
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
                                controller.ManageThePageProductsUers.value =
                                    false;
                                controller.isHaveUsersProducts.value = false;
                              },
                              child: Text(
                                "185".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color:
                                        const Color.fromARGB(255, 47, 47, 47),
                                    fontSize: screenWidth * 0.043,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.07,
                          right: screenWidth * 0.12,
                          left: screenWidth * 0.12),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          onTap: () {
                            controller.ManageThePageProductsUers.value = false;
                          },
                          child: Text(
                            "186".tr,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: const Color.fromARGB(255, 47, 47, 47),
                                fontSize: screenWidth * 0.043,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.14,
                          bottom: screenHeight * 0.12),
                      child: Align(
                          alignment: Alignment.center,
                          child: TheProductsWidgetUser())),
                  Visibility(
                      visible: controller.TheOptionsOfTheProduct.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.TheOptionsOfTheProduct.value,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.TheOptionsOfTheProduct.value,
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.2),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              controller.TheOptionsOfTheProduct.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.WelcomeRed,
                              ),
                              child: Text(
                                "X",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.060,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )),
                  Visibility(
                      visible: controller.TheOptionsOfTheProduct.value,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.75,
                            height: screenHeight / 6,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: screenWidth * 0.06),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "187".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.049,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ))),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.03),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.showTheEditPage.value = true;
                                    },
                                    child: Container(
                                      width: screenWidth * 0.3,
                                      height: screenHeight / 22,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Center(
                                        child: Text(
                                          "188".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.043,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.03),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: InkWell(
                                    onTap: () {
                                      controller.deleteProductUser(
                                          controller.product.idPro.toString());
                                    },
                                    child: Container(
                                      width: screenWidth * 0.3,
                                      height: screenHeight / 22,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Center(
                                        child: Text(
                                          "189".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.043,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      )),

                  //////
                  EditTheProducts()
                ],
              )),
            )));
  }
}
