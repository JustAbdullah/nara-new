import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/localization/changelanguage.dart';

class TheProductsWidgetUser extends StatelessWidget {
  const TheProductsWidgetUser({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return GetX<HomeController>(
        builder: (controller) => FutureBuilder(
            future: controller.getTheUserProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (controller.isHaveUsersProducts.value == false) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "230".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.blackNumberFourBlackMode,
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
              } else
                return GridView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {
                                homeController.product.idPro = snapshot
                                    .data['data'][i]['id_product']
                                    .toString();

                                homeController.product.namePro = snapshot
                                    .data['data'][i]['name_product']
                                    .toString();

                                homeController.product.nameProEn = snapshot
                                    .data['data'][i]['name_product_en']
                                    .toString();

                                homeController.product.imagePro = snapshot
                                    .data['data'][i]['image_product']
                                    .toString();

                                homeController.product.quantityTheProduct =
                                    snapshot.data['data'][i]['quantity']
                                        .toString();
                                homeController.product.pricePro = snapshot
                                    .data['data'][i]['price_product']
                                    .toString();
                                homeController.product.bodyPro = snapshot
                                    .data['data'][i]['body_product']
                                    .toString();
                                homeController.product.bodyProEn = snapshot
                                    .data['data'][i]['body_product_en']
                                    .toString();

                                homeController.product.imageProtwo = snapshot
                                    .data['data'][i]['image_product_two']
                                    .toString();

                                homeController.product.imageProthree = snapshot
                                    .data['data'][i]['image_product_three']
                                    .toString();
                                homeController.product.imageProfour = snapshot
                                    .data['data'][i]['image_product_four']
                                    .toString();

                                ///

                                homeController.product.pricePro = snapshot
                                    .data['data'][i]['price_product']
                                    .toString();
                                ;
                                homeController.product.oldPrice = snapshot
                                    .data['data'][i]['old_price']
                                    .toString();
                                ;
                                homeController.product.quantityTheProduct =
                                    snapshot.data['data'][i]['quantity']
                                        .toString();
                                ;
                                homeController.product.nameBrandAr = snapshot
                                    .data['data'][i]['name_brand_ar']
                                    .toString();
                                homeController.product.nameBrandEn = snapshot
                                    .data['data'][i]['name_brand_en']
                                    .toString();
                                homeController.product.idBrand = snapshot
                                    .data['data'][i]['id_brand']
                                    .toString();
                                homeController.product.idType = snapshot
                                    .data['data'][i]['id_type']
                                    .toString();
                                homeController.product.idSubType = snapshot
                                    .data['data'][i]['id_subtype']
                                    .toString();

                                controller.TheOptionsOfTheProduct.value = true;

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
                                            child: InkWell(
                                              onTap: () {
                                                homeController.product.idPro =
                                                    snapshot.data['data'][i]
                                                            ['id_product']
                                                        .toString();

                                                homeController.product.namePro =
                                                    snapshot.data['data'][i]
                                                            ['name_product']
                                                        .toString();

                                                homeController
                                                        .product.nameProEn =
                                                    snapshot.data['data'][i]
                                                            ['name_product_en']
                                                        .toString();

                                                homeController
                                                        .product.imagePro =
                                                    snapshot.data['data'][i]
                                                            ['image_product']
                                                        .toString();

                                                homeController.product
                                                        .quantityTheProduct =
                                                    snapshot.data['data'][i]
                                                            ['quantity']
                                                        .toString();
                                                homeController
                                                        .product.pricePro =
                                                    snapshot.data['data'][i]
                                                            ['price_product']
                                                        .toString();
                                                homeController.product.bodyPro =
                                                    snapshot.data['data'][i]
                                                            ['body_product']
                                                        .toString();
                                                homeController
                                                        .product.bodyProEn =
                                                    snapshot.data['data'][i]
                                                            ['body_product_en']
                                                        .toString();

                                                homeController
                                                        .product.imageProtwo =
                                                    snapshot.data['data'][i][
                                                            'image_product_two']
                                                        .toString();

                                                homeController
                                                        .product.imageProthree =
                                                    snapshot.data['data'][i][
                                                            'image_product_three']
                                                        .toString();
                                                homeController
                                                        .product.imageProfour =
                                                    snapshot.data['data'][i][
                                                            'image_product_four']
                                                        .toString();

                                                ///

                                                homeController
                                                        .product.pricePro =
                                                    snapshot.data['data'][i]
                                                            ['price_product']
                                                        .toString();
                                                ;
                                                homeController
                                                        .product.oldPrice =
                                                    snapshot.data['data'][i]
                                                            ['old_price']
                                                        .toString();
                                                ;
                                                homeController.product
                                                        .quantityTheProduct =
                                                    snapshot.data['data'][i]
                                                            ['quantity']
                                                        .toString();
                                                ;
                                                homeController
                                                        .product.nameBrandAr =
                                                    snapshot.data['data'][i]
                                                            ['name_brand_ar']
                                                        .toString();
                                                homeController
                                                        .product.nameBrandEn =
                                                    snapshot.data['data'][i]
                                                            ['name_brand_en']
                                                        .toString();

                                                homeController.product.idBrand =
                                                    snapshot.data['data'][i]
                                                            ['id_brand']
                                                        .toString();
                                                homeController.product.idType =
                                                    snapshot.data['data'][i]
                                                            ['id_type']
                                                        .toString();
                                                homeController
                                                        .product.idSubType =
                                                    snapshot.data['data'][i]
                                                            ['id_subtype']
                                                        .toString();
                                              },
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
                                                ("${snapshot.data['data'][i]['old_price'].toString()}"),
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.WelcomeRed,
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
                                                "SAR".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: AppColors.WelcomeRed,
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
                                                  height: screenHeight * 0.002,
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
                                                ("${snapshot.data['data'][i]['price_product'].toString()}"),
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
                                              SizedBox(
                                                width: screenWidth * 0.01,
                                              ),
                                              Text(
                                                "SAR".tr,
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
                                        )),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: screenHeight * 0.0,
                                              left: screenWidth * 0.02,
                                              right: screenWidth * 0.02),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: InkWell(
                                                  onTap: () {
                                                    homeController
                                                            .product.idPro =
                                                        snapshot.data['data'][i]
                                                                ['id_product']
                                                            .toString();

                                                    homeController
                                                            .product.namePro =
                                                        snapshot.data['data'][i]
                                                                ['name_product']
                                                            .toString();

                                                    homeController
                                                            .product.nameProEn =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_product_en']
                                                            .toString();

                                                    homeController
                                                            .product.imagePro =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'image_product']
                                                            .toString();

                                                    homeController.product
                                                            .quantityTheProduct =
                                                        snapshot.data['data'][i]
                                                                ['quantity']
                                                            .toString();
                                                    homeController
                                                            .product.pricePro =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'price_product']
                                                            .toString();
                                                    homeController
                                                            .product.bodyPro =
                                                        snapshot.data['data'][i]
                                                                ['body_product']
                                                            .toString();
                                                    homeController
                                                            .product.bodyProEn =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'body_product_en']
                                                            .toString();

                                                    homeController.product
                                                            .imageProtwo =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'image_product_two']
                                                            .toString();

                                                    homeController.product
                                                            .imageProthree =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'image_product_three']
                                                            .toString();
                                                    homeController.product
                                                            .imageProfour =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'image_product_four']
                                                            .toString();

                                                    ///

                                                    homeController
                                                            .product.pricePro =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'price_product']
                                                            .toString();
                                                    ;
                                                    homeController
                                                            .product.oldPrice =
                                                        snapshot.data['data'][i]
                                                                ['old_price']
                                                            .toString();
                                                    ;
                                                    homeController.product
                                                            .quantityTheProduct =
                                                        snapshot.data['data'][i]
                                                                ['quantity']
                                                            .toString();
                                                    ;
                                                    homeController.product
                                                            .nameBrandAr =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_ar']
                                                            .toString();
                                                    homeController.product
                                                            .nameBrandEn =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_en']
                                                            .toString();

                                                    homeController
                                                            .product.idBrand =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();
                                                    homeController
                                                            .product.idType =
                                                        snapshot.data['data'][i]
                                                                ['id_type']
                                                            .toString();
                                                    homeController
                                                            .product.idSubType =
                                                        snapshot.data['data'][i]
                                                                ['id_subtype']
                                                            .toString();

                                                    controller.nameProductAr =
                                                        snapshot.data['data'][i]
                                                                ['name_product']
                                                            .toString();

                                                    controller.nameProductEn =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_product_en']
                                                            .toString();
                                                    controller.bodyProductAr =
                                                        snapshot.data['data'][i]
                                                                ['body_product']
                                                            .toString();
                                                    controller.bodyProductEn =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'body_product_en']
                                                            .toString();
                                                    controller.priceNew =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'price_product']
                                                            .toString();
                                                    controller.priceOld =
                                                        snapshot.data['data'][i]
                                                                ['old_price']
                                                            .toString();
                                                    controller.thetype =
                                                        int.parse(snapshot
                                                            .data['data'][i]
                                                                ['id_type']
                                                            .toString());

                                                    controller.thesubtype =
                                                        int.parse(snapshot
                                                            .data['data'][i]
                                                                ['id_subtype']
                                                            .toString());
                                                    controller.thebrand =
                                                        int.parse(snapshot
                                                            .data['data'][i]
                                                                ['id_brand']
                                                            .toString());
                                                    controller.image = snapshot
                                                        .data['data'][i]
                                                            ['image_product']
                                                        .toString();
                                                    controller.idPro = snapshot
                                                        .data['data'][i]
                                                            ['id_product']
                                                        .toString();
                                                    controller
                                                        .TheOptionsOfTheProduct
                                                        .value = true;
                                                  },
                                                  child: Container(
                                                      width:
                                                          screenHeight * 0.12,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.balckgray,
                                                      ),
                                                      child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      screenWidth *
                                                                          0.015),
                                                          child: Text(
                                                            ("إدارة".tr),
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
                                                            textAlign: TextAlign
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
                          (MediaQuery.of(context).size.height / 1.3),
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                    ));
            }));
  }
}
