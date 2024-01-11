import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';

class ViewTheProductsMainTypes extends StatelessWidget {
  const ViewTheProductsMainTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getAllTheProdutsWithMainTypes(
            homeController.getIdMainType.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return homeController.isNoData.value == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          "94".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Color(0xFFC70039),
                              fontSize: screenWidth * 0.058,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ])
                : GridView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {
                                homeController.product.idPro =
                                    snapshot.data['data'][i]['id_product'];

                                homeController.product.namePro =
                                    snapshot.data['data'][i]['name_product'];

                                homeController.product.nameProEn =
                                    snapshot.data['data'][i]['name_product_en'];

                                homeController.product.imagePro =
                                    snapshot.data['data'][i]['image_product'];

                                homeController.product.quantityTheProduct =
                                    snapshot.data['data'][i]['quantity'];
                                homeController.product.pricePro =
                                    snapshot.data['data'][i]['price_product'];
                                homeController.product.bodyPro =
                                    snapshot.data['data'][i]['body_product'];
                                homeController.product.bodyProEn =
                                    snapshot.data['data'][i]['body_product_en'];

                                homeController.product.imageProtwo = snapshot
                                    .data['data'][i]['image_product_two'];

                                homeController.product.imageProthree = snapshot
                                    .data['data'][i]['image_product_three'];
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

                                homeController.theOldNPrice = int.parse(
                                    (snapshot.data['data'][i]['old_price']
                                        .toString()));

                                homeController.theNPrice = int.parse(
                                    (snapshot.data['data'][i]['price_product'])
                                        .toString());

                                /*       controller.theOldPrice =
                                      controller.theOldNPrice / 12.1581.floor();
                                  controller.thePrice =
                                      controller.theNPrice / 12.1581.floor();*/

                                homeController.product.KoldPrice =
                                    homeController.theOldPrice.toString();
                                homeController.product.KpricePro =
                                    homeController.thePrice.toString();
                                homeController.thePriceProductOld.value =
                                    int.parse((snapshot.data['data'][i]
                                                ['old_price']
                                            .toString())) *
                                        homeController.theCountPrice.value;

                                homeController.thePriceProduct.value =
                                    int.parse((snapshot.data['data'][i]
                                                ['price_product'])
                                            .toString()) *
                                        homeController.theCountPrice.value;
                                homeController.viewTheDetilas.value = true;
/////////////////////
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.02),
                                child: Container(
                                  color: AppColors.theMainColor,
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Column(children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.00),
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

                                      ////////////////

                                      ///////////////////
                                      Container(
                                        width: screenWidth * 0.30,
                                        child: GetX<ChangeLanguageToLocale>(
                                          builder: (scontroller) => scontroller
                                                      .changeLangData ==
                                                  1
                                              ? Text(
                                                  ("${snapshot.data['data'][i]['name_product'].toString()}"),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.050,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                )
                                              : Text(
                                                  ("${snapshot.data['data'][i]['name_product_en'].toString()}"),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.balckgray,
                                                    fontSize:
                                                        screenWidth * 0.050,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${homeController.theNAmeOfCoun.value}",
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
                                                  (int.parse((snapshot
                                                              .data['data'][i]
                                                                  ['old_price']
                                                              .toString())) *
                                                          homeController
                                                              .theCountPrice
                                                              .value)
                                                      .toStringAsFixed(2),
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
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4),
                                                  child: Text(
                                                    "318".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            AppColors.balckgray,
                                                        fontSize:
                                                            screenWidth * 0.024,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.01,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${homeController.theNAmeOfCoun.value}",
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Text(
                                            (int.parse((snapshot.data['data'][i]
                                                            ['price_product']
                                                        .toString())) *
                                                    homeController
                                                        .theCountPrice.value)
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              homeController.product.idPro =
                                                  snapshot.data['data'][i]
                                                      ['id_product'];

                                              homeController.product.namePro =
                                                  snapshot.data['data'][i]
                                                      ['name_product'];

                                              homeController.product.nameProEn =
                                                  snapshot.data['data'][i]
                                                      ['name_product_en'];

                                              homeController.product.imagePro =
                                                  snapshot.data['data'][i]
                                                      ['image_product'];

                                              homeController.product
                                                      .quantityTheProduct =
                                                  snapshot.data['data'][i]
                                                      ['quantity'];
                                              homeController.product.pricePro =
                                                  snapshot.data['data'][i]
                                                      ['price_product'];

                                              homeController.product.oldPrice =
                                                  snapshot.data['data'][i]
                                                      ['old_price'];
                                              homeController.product.bodyPro =
                                                  snapshot.data['data'][i]
                                                      ['body_product'];
                                              homeController.product.bodyProEn =
                                                  snapshot.data['data'][i]
                                                      ['body_product_en'];

                                              homeController
                                                      .product.imageProtwo =
                                                  snapshot.data['data'][i]
                                                      ['image_product_two'];

                                              homeController
                                                      .product.imageProthree =
                                                  snapshot.data['data'][i]
                                                      ['image_product_three'];
                                              homeController
                                                      .product.imageProfour =
                                                  snapshot.data['data'][i]
                                                      ['image_product_four'];

                                              ///

                                              ///

                                              homeController.product.pricePro =
                                                  snapshot.data['data'][i]
                                                      ['price_product'];
                                              homeController.product
                                                      .quantityTheProduct =
                                                  snapshot.data['data'][i]
                                                      ['quantity'];

                                              homeController
                                                      .product.nameBrandAr =
                                                  snapshot.data['data'][i]
                                                      ['name_brand_ar'];
                                              homeController
                                                      .product.nameBrandEn =
                                                  snapshot.data['data'][i]
                                                      ['name_brand_en'];
                                              homeController
                                                  .getColorsTheProducts(
                                                      homeController
                                                              .product.idPro =
                                                          snapshot.data['data']
                                                                  [i]
                                                                  ['id_product']
                                                              .toString());
                                              homeController.idTheProduct =
                                                  snapshot.data['data'][i]
                                                          ['id_product']
                                                      .toString();

                                              homeController.theOldNPrice =
                                                  int.parse((snapshot
                                                      .data['data'][i]
                                                          ['old_price']
                                                      .toString()));

                                              homeController.theNPrice =
                                                  int.parse(
                                                      (snapshot.data['data'][i]
                                                              ['price_product'])
                                                          .toString());

                                              /*   controller.theOldPrice =
                                                    controller.theOldNPrice /
                                                        12.1581.floor();
                                                controller.thePrice =
                                                    controller.theNPrice /
                                                        12.1581.floor();
                                                controller.product.KoldPrice =
                                                    controller.theOldPrice
                                                        .toString();*/
                                              homeController.product.KpricePro =
                                                  homeController.thePrice
                                                      .toString();
                                              homeController
                                                  .viewTheDetilas.value = true;
                                            },
                                            child: Container(
                                                width: screenHeight * 0.16,
                                                decoration: BoxDecoration(
                                                  color: AppColors.balckgray,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.015),
                                                    child: Text(
                                                      ("95".tr),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors.white,
                                                        fontSize:
                                                            screenWidth * 0.035,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
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
            return GridView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Color.fromARGB(31, 169, 167, 167),
                      highlightColor: AppColors.white,
                      enabled: true,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {
                                /*       controller.theOldPrice =
                                      controller.theOldNPrice / 12.1581.floor();
                                  controller.thePrice =
                                      controller.theNPrice / 12.1581.floor();*/

/////////////////////
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.02),
                                child: Container(
                                  color: AppColors.theMainColor,
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Column(children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.00),
                                          child: Container(
                                            width: screenWidth * 0.45,
                                            height: screenHeight * 0.17,
                                            child: Container(
                                              width: screenWidth * 0.45,
                                              height: screenHeight * 0.17,
                                              color: Color.fromARGB(
                                                      255, 212, 208, 208)
                                                  .withOpacity(0.7),
                                              child: Text(
                                                "322".tr,
                                              ),
                                            ),
                                          )),

                                      ////////////////

                                      ///////////////////
                                      Container(
                                          width: screenWidth * 0.30,
                                          child: Text(
                                            ("322".tr),
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.balckgray,
                                              fontSize: screenWidth * 0.050,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          )),

                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "322".tr,
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
                                                  "322".tr,
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
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.02),
                                                child: Container(
                                                  width: screenWidth / 5,
                                                  height: screenHeight * 0.002,
                                                  color: AppColors.WelcomeRed,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "322".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Text(
                                            "322".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: AppColors
                                                    .blackNumberFourBlackMode,
                                                fontSize: screenWidth * 0.050,
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                                width: screenHeight * 0.16,
                                                decoration: BoxDecoration(
                                                  color: AppColors.balckgray,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.015),
                                                    child: Text(
                                                      "322".tr,
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: AppColors.white,
                                                        fontSize:
                                                            screenWidth * 0.035,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              ))));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3),
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ));
          }
        });
  }
}
