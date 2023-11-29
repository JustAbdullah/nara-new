import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';

class ViewTheProductsUsers extends StatelessWidget {
  const ViewTheProductsUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return GetX<HomeController>(
        builder: (controller) => FutureBuilder(
            future: controller.getProductsUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.hasData) {
                if (controller.emptyshowTheProductUsers.value == false) {
                  controller.emptyshowTheProductUsers.value = false;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "94".tr,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Color(0xFFC70039),
                            fontSize: screenWidth * 0.038,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else
                  return GridView.builder(
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, i) {
                        homeController.ind = snapshot.data['data'].length;
                        homeController.product.imagePro =
                            snapshot.data['data'][i]['image_product'];

                        controller.theOldNPrice = int.parse(
                            (snapshot.data['data'][i]['old_price'].toString()));

                        controller.theNPrice = int.parse((snapshot.data['data']
                                [i]['price_product'])
                            .toString());

                        controller.theOldPrice =
                            controller.theOldNPrice / 12.1581.floor();
                        controller.thePrice =
                            controller.theNPrice / 12.1581.floor();

                        return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: InkWell(
                                onTap: () async {
                                  homeController.product.idPro =
                                      snapshot.data['data'][i]['id_product'];

                                  homeController.product.namePro =
                                      snapshot.data['data'][i]['name_product'];

                                  homeController.product.nameProEn = snapshot
                                      .data['data'][i]['name_product_en'];
                                  homeController.product.imagePro = snapshot
                                      .data['data'][i]['image_product']
                                      .toString();

                                  homeController.product.imagePro =
                                      snapshot.data['data'][i]['image_product'];

                                  homeController.product.quantityTheProduct =
                                      snapshot.data['data'][i]['quantity'];
                                  homeController.product.pricePro =
                                      snapshot.data['data'][i]['price_product'];
                                  homeController.product.bodyPro =
                                      snapshot.data['data'][i]['body_product'];
                                  homeController.product.bodyProEn = snapshot
                                      .data['data'][i]['body_product_en'];

                                  homeController.product.imageProtwo = snapshot
                                      .data['data'][i]['image_product_two'];

                                  homeController.product.imageProthree =
                                      snapshot.data['data'][i]
                                          ['image_product_three'];
                                  homeController.product.imageProfour = snapshot
                                      .data['data'][i]['image_product_four'];

                                  ///

                                  homeController.product.pricePro =
                                      snapshot.data['data'][i]['price_product'];
                                  homeController.product.oldPrice =
                                      snapshot.data['data'][i]['old_price'];
                                  homeController.product.quantityTheProduct =
                                      snapshot.data['data'][i]['quantity'];
                                  homeController.product.nameBrandAr =
                                      snapshot.data['data'][i]['name_brand_ar'];
                                  homeController.product.nameBrandEn =
                                      snapshot.data['data'][i]['name_brand_en'];

                                  homeController.getColorsTheProducts(
                                      homeController.product.idPro = snapshot
                                          .data['data'][i]['id_product']
                                          .toString());

                                  homeController.idTheProduct = snapshot
                                      .data['data'][i]['id_product']
                                      .toString();

                                  controller.theOldNPrice = int.parse((snapshot
                                      .data['data'][i]['old_price']
                                      .toString()));

                                  controller.theNPrice = int.parse((snapshot
                                          .data['data'][i]['price_product'])
                                      .toString());

                                  controller.theOldPrice =
                                      controller.theOldNPrice / 12.1581.floor();
                                  controller.thePrice =
                                      controller.theNPrice / 12.1581.floor();

                                  controller.product.KoldPrice =
                                      controller.theOldPrice.toString();
                                  controller.product.KpricePro =
                                      controller.thePrice.toString();
                                  homeController.viewTheDetilas.value = true;
/////////////////////
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.02),
                                  child: Container(
                                    color: AppColors.theMainColor,
                                    child: Stack(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.00),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth * 0.45,
                                              height: screenHeight * 0.17,
                                              child: CachedNetworkImage(
                                                width: screenWidth * 0.45,
                                                height: screenHeight * 0.17,
                                                color: Color.fromARGB(
                                                        255, 212, 208, 208)
                                                    .withOpacity(0.7),
                                                fit: BoxFit.contain,
                                                imageUrl:
                                                    ("${snapshot.data['data'][i]['image_product'].toString()}"),
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
                                                    child:
                                                        CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                      AppColors.WelcomeRed,
                                                    )),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            )),
                                      ),

                                      ////////////////

                                      ///////////////////
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenHeight * 0.07,
                                                  left: screenWidth * 0.0),
                                              child: Container(
                                                width: screenWidth * 0.30,
                                                child: GetX<
                                                    ChangeLanguageToLocale>(
                                                  builder: (scontroller) =>
                                                      scontroller.changeLangData ==
                                                              1
                                                          ? Text(
                                                              ("${snapshot.data['data'][i]['name_product'].toString()}"),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .balckgray,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.050,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                            )
                                                          : Text(
                                                              ("${snapshot.data['data'][i]['name_product_en'].toString()}"),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .balckgray,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.050,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                            ),
                                                ),
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.15,
                                              right: screenWidth * 0.04,
                                              left: screenWidth * 0.04),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.theNameOfCoins.value}",
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.WelcomeRed,
                                                      fontSize:
                                                          screenWidth * 0.050,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.01,
                                                ),
                                                Text(
                                                  (controller.theCoins.value ==
                                                          2
                                                      ? "${controller.theOldPrice.toStringAsFixed(2)}"
                                                      : "${snapshot.data['data'][i]['old_price'].toString()}"),
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.WelcomeRed,
                                                      fontSize:
                                                          screenWidth * 0.050,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.15,
                                              right: screenWidth * 0.04,
                                              left: screenWidth * 0.04),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: screenWidth / 5,
                                                    height:
                                                        screenHeight * 0.002,
                                                    color: AppColors.WelcomeRed,
                                                  ),
                                                ],
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.21,
                                              right: screenWidth * 0.04,
                                              left: screenWidth * 0.04),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.theNameOfCoins.value}",
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
                                                SizedBox(
                                                  width: screenWidth * 0.01,
                                                ),
                                                Text(
                                                  (controller.theCoins.value ==
                                                          2
                                                      ? "${controller.thePrice.toStringAsFixed(2)}"
                                                      : "${snapshot.data['data'][i]['price_product'].toString()}"),
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .blackNumberFourBlackMode,
                                                      fontSize:
                                                          screenWidth * 0.050,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: screenHeight * 0.0,
                                                left: screenWidth * 0.02,
                                                right: screenWidth * 0.02),
                                            child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                    onTap: () {
                                                      homeController
                                                              .product.idPro =
                                                          snapshot.data['data']
                                                              [i]['id_product'];

                                                      homeController
                                                              .product.namePro =
                                                          snapshot.data['data']
                                                                  [i]
                                                              ['name_product'];

                                                      homeController.product
                                                          .nameProEn = snapshot
                                                              .data['data'][i]
                                                          ['name_product_en'];

                                                      homeController.product
                                                          .imagePro = snapshot
                                                              .data['data'][i]
                                                          ['image_product'];

                                                      homeController.product
                                                              .quantityTheProduct =
                                                          snapshot.data['data']
                                                              [i]['quantity'];
                                                      homeController.product
                                                          .pricePro = snapshot
                                                              .data['data'][i]
                                                          ['price_product'];

                                                      homeController.product
                                                              .oldPrice =
                                                          snapshot.data['data']
                                                              [i]['old_price'];
                                                      homeController
                                                              .product.bodyPro =
                                                          snapshot.data['data']
                                                                  [i]
                                                              ['body_product'];
                                                      homeController.product
                                                          .bodyProEn = snapshot
                                                              .data['data'][i]
                                                          ['body_product_en'];

                                                      homeController.product
                                                          .imageProtwo = snapshot
                                                              .data['data'][i]
                                                          ['image_product_two'];

                                                      homeController.product
                                                          .imageProthree = snapshot
                                                              .data['data'][i][
                                                          'image_product_three'];
                                                      homeController.product
                                                          .imageProfour = snapshot
                                                              .data['data'][i][
                                                          'image_product_four'];

                                                      ///

                                                      ///

                                                      homeController.product
                                                          .pricePro = snapshot
                                                              .data['data'][i]
                                                          ['price_product'];
                                                      homeController.product
                                                              .quantityTheProduct =
                                                          snapshot.data['data']
                                                              [i]['quantity'];

                                                      homeController.product
                                                              .nameBrandAr =
                                                          snapshot.data['data']
                                                                  [i]
                                                              ['name_brand_ar'];
                                                      homeController.product
                                                              .nameBrandEn =
                                                          snapshot.data['data']
                                                                  [i]
                                                              ['name_brand_en'];
                                                      homeController
                                                          .getColorsTheProducts(
                                                              homeController
                                                                      .product
                                                                      .idPro =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_product']
                                                                      .toString());
                                                      homeController
                                                              .idTheProduct =
                                                          snapshot.data['data']
                                                                  [i]
                                                                  ['id_product']
                                                              .toString();

                                                      controller.theOldNPrice =
                                                          int.parse((snapshot
                                                              .data['data'][i]
                                                                  ['old_price']
                                                              .toString()));

                                                      controller.theNPrice =
                                                          int.parse((snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'price_product'])
                                                              .toString());

                                                      controller.theOldPrice =
                                                          controller
                                                                  .theOldNPrice /
                                                              12.1581.floor();
                                                      controller.thePrice =
                                                          controller.theNPrice /
                                                              12.1581.floor();
                                                      controller.product
                                                              .KoldPrice =
                                                          controller.theOldPrice
                                                              .toString();
                                                      controller.product
                                                              .KpricePro =
                                                          controller.thePrice
                                                              .toString();
                                                      homeController
                                                          .viewTheDetilas
                                                          .value = true;
                                                    },
                                                    child: Container(
                                                        width:
                                                            screenHeight * 0.08,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .balckgray,
                                                        ),
                                                        child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        screenWidth *
                                                                            0.015),
                                                            child: Text(
                                                              ("95".tr),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .white,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.035,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ))))),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                )));
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ));
              } else {
                return Shimmer(
                  duration: Duration(seconds: 45), //Default value
                  interval: Duration(
                      seconds: 45), //Default value: Duration(seconds: 0)
                  color: Colors.white, //Default value
                  colorOpacity: 0, //Default value
                  enabled: true, //Default value
                  direction: ShimmerDirection.fromLTRB(), //Default Value
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: screenWidth,
                    height: screenHeight,
                  ),
                );
              }
            }));
  }
}
