import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/localization/changelanguage.dart';
import '../home_widgets/view_widget_products_home/details_products_widget.dart';

class BrandsTheDetailsWidget extends StatelessWidget {
  const BrandsTheDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
      builder: (controller) => Visibility(
          visible: controller.DetailsBrands.value,
          child: Scaffold(
            backgroundColor: AppColors.theMainColor,
            body: SafeArea(
                child: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: screenWidth,
                  height: screenHeight / 4,
                  color: Colors.white,
                ),
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
                            controller.DetailsBrands.value = false;
                          },
                          child: Text(
                            "114.1".tr,
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
                            controller.DetailsBrands.value = false;
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
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.06,
                          right: screenWidth * 0.12,
                          left: screenWidth * 0.12),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GetX<ChangeLanguageToLocale>(
                          builder: (scontroller) => scontroller
                                      .changeLangData ==
                                  1
                              ? Text(
                                  " ${homeController.Thebrand.nameBrand}",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color:
                                          const Color.fromARGB(255, 47, 47, 47),
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  " ${homeController.Thebrand.nameBrandEn}",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color:
                                          const Color.fromARGB(255, 47, 47, 47),
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.037),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CachedNetworkImage(
                          height: screenHeight * 0.21,
                          width: screenWidth * 0.35,
                          fit: BoxFit.contain,
                          imageUrl: ("${homeController.Thebrand.ImageBrand}"),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7),
                                  bottomLeft: Radius.circular(7)),
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
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.13,
                          right: screenWidth * 0.03,
                          left: screenWidth * 0.03),
                      child: Container(
                        width: screenWidth / 2.5,
                        child: Text(
                          "114.2".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: AppColors.blackNumberFourBlackMode,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.27),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        child: FutureBuilder(
                            future: homeController.getDataProductsBrands(
                                homeController.Thebrand.idBrand.toString()),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    itemCount: snapshot.data['data'].length,
                                    itemBuilder: (context, i) {
                                      homeController.ind =
                                          snapshot.data['data'].length;

                                      controller.theOldNPrice = int.parse(
                                          (snapshot.data['data'][i]['old_price']
                                              .toString()));

                                      controller.theNPrice = int.parse((snapshot
                                              .data['data'][i]['price_product'])
                                          .toString());

                                      controller.theOldPrice =
                                          controller.theOldNPrice /
                                              12.1581.floor();
                                      controller.thePrice =
                                          controller.theNPrice /
                                              12.1581.floor();

                                      return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 2),
                                          child: InkWell(
                                              onTap: () async {
                                                homeController.product.idPro =
                                                    snapshot.data['data'][i]
                                                        ['id_product'];

                                                homeController.product.namePro =
                                                    snapshot.data['data'][i]
                                                        ['name_product'];

                                                homeController
                                                        .product.nameProEn =
                                                    snapshot.data['data'][i]
                                                        ['name_product_en'];

                                                homeController
                                                        .product.imagePro =
                                                    snapshot.data['data'][i]
                                                        ['image_product'];

                                                homeController.product
                                                        .quantityTheProduct =
                                                    snapshot.data['data'][i]
                                                        ['quantity'];
                                                homeController
                                                        .product.pricePro =
                                                    snapshot.data['data'][i]
                                                        ['price_product'];
                                                homeController.product.bodyPro =
                                                    snapshot.data['data'][i]
                                                        ['body_product'];
                                                homeController
                                                        .product.bodyProEn =
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

                                                homeController
                                                        .product.pricePro =
                                                    snapshot.data['data'][i]
                                                        ['price_product'];
                                                homeController
                                                        .product.oldPrice =
                                                    snapshot.data['data'][i]
                                                        ['old_price'];
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
                                                            snapshot
                                                                .data['data'][i]
                                                                    [
                                                                    'id_product']
                                                                .toString());

                                                homeController.idTheProduct =
                                                    snapshot.data['data'][i]
                                                            ['id_product']
                                                        .toString();

                                                controller.theOldNPrice =
                                                    int.parse((snapshot
                                                        .data['data'][i]
                                                            ['old_price']
                                                        .toString()));

                                                controller.theNPrice =
                                                    int.parse((snapshot
                                                                .data['data'][i]
                                                            ['price_product'])
                                                        .toString());

                                                controller.theOldPrice =
                                                    controller.theOldNPrice /
                                                        12.1581.floor();
                                                controller.thePrice =
                                                    controller.theNPrice /
                                                        12.1581.floor();

                                                controller.product.KoldPrice =
                                                    controller.theOldPrice
                                                        .toString();
                                                controller.product.KpricePro =
                                                    controller.thePrice
                                                        .toString();
                                                homeController.viewTheDetilas
                                                    .value = true;
/////////////////////
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        screenHeight * 0.02),
                                                child: Container(
                                                  color: AppColors.theMainColor,
                                                  child: SingleChildScrollView(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    child: Column(children: [
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              top:
                                                                  screenHeight *
                                                                      0.00),
                                                          child: Container(
                                                            width: screenWidth *
                                                                0.45,
                                                            height:
                                                                screenHeight *
                                                                    0.17,
                                                            child:
                                                                CachedNetworkImage(
                                                              width:
                                                                  screenWidth *
                                                                      0.45,
                                                              height:
                                                                  screenHeight *
                                                                      0.17,
                                                              color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          212,
                                                                          208,
                                                                          208)
                                                                  .withOpacity(
                                                                      0.7),
                                                              fit: BoxFit
                                                                  .contain,
                                                              imageUrl:
                                                                  ("${snapshot.data['data'][i]['image_product'].toString()}"),
                                                              imageBuilder:
                                                                  (context,
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
                                                                  (context,
                                                                          url) =>
                                                                      SizedBox(
                                                                width: 15,
                                                                height: 15,
                                                                child: Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                    AppColors
                                                                        .WelcomeRed,
                                                                  )),
                                                                ),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                          )),

                                                      ////////////////

                                                      ///////////////////
                                                      Container(
                                                        width:
                                                            screenWidth * 0.30,
                                                        child: GetX<
                                                            ChangeLanguageToLocale>(
                                                          builder: (scontroller) =>
                                                              scontroller.changeLangData ==
                                                                      1
                                                                  ? Text(
                                                                      ("${snapshot.data['data'][i]['name_product'].toString()}"),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .balckgray,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.050,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                    )
                                                                  : Text(
                                                                      ("${snapshot.data['data'][i]['name_product_en'].toString()}"),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .balckgray,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.050,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${controller.theNameOfCoins.value}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .WelcomeRed,
                                                                      fontSize:
                                                                          screenWidth *
                                                                              0.050,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      screenWidth *
                                                                          0.01,
                                                                ),
                                                                Text(
                                                                  (controller.theCoins
                                                                              .value ==
                                                                          2
                                                                      ? "${controller.theOldPrice.toStringAsFixed(2)}"
                                                                      : "${snapshot.data['data'][i]['old_price'].toString()}"),
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .WelcomeRed,
                                                                      fontSize:
                                                                          screenWidth *
                                                                              0.050,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: screenHeight *
                                                                        0.02),
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      screenWidth /
                                                                          5,
                                                                  height:
                                                                      screenHeight *
                                                                          0.002,
                                                                  color: AppColors
                                                                      .WelcomeRed,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${controller.theNameOfCoins.value}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .blackNumberFourBlackMode,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.050,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            (controller.theCoins
                                                                        .value ==
                                                                    2
                                                                ? "${controller.thePrice.toStringAsFixed(2)}"
                                                                : "${snapshot.data['data'][i]['price_product'].toString()}"),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .blackNumberFourBlackMode,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.050,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              homeController
                                                                  .product
                                                                  .idPro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'id_product'];

                                                              homeController
                                                                  .product
                                                                  .namePro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'name_product'];

                                                              homeController
                                                                  .product
                                                                  .nameProEn = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'name_product_en'];

                                                              homeController
                                                                  .product
                                                                  .imagePro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'image_product'];

                                                              homeController
                                                                  .product
                                                                  .quantityTheProduct = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  ['quantity'];
                                                              homeController
                                                                  .product
                                                                  .pricePro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'price_product'];

                                                              homeController
                                                                  .product
                                                                  .oldPrice = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  ['old_price'];
                                                              homeController
                                                                  .product
                                                                  .bodyPro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'body_product'];
                                                              homeController
                                                                  .product
                                                                  .bodyProEn = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'body_product_en'];

                                                              homeController
                                                                  .product
                                                                  .imageProtwo = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'image_product_two'];

                                                              homeController
                                                                  .product
                                                                  .imageProthree = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'image_product_three'];
                                                              homeController
                                                                  .product
                                                                  .imageProfour = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'image_product_four'];

                                                              ///

                                                              ///

                                                              homeController
                                                                  .product
                                                                  .pricePro = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'price_product'];
                                                              homeController
                                                                  .product
                                                                  .quantityTheProduct = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  ['quantity'];

                                                              homeController
                                                                  .product
                                                                  .nameBrandAr = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'name_brand_ar'];
                                                              homeController
                                                                  .product
                                                                  .nameBrandEn = snapshot
                                                                          .data[
                                                                      'data'][i]
                                                                  [
                                                                  'name_brand_en'];
                                                              homeController.getColorsTheProducts(
                                                                  homeController
                                                                      .product
                                                                      .idPro = snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_product']
                                                                      .toString());
                                                              homeController
                                                                      .idTheProduct =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_product']
                                                                      .toString();

                                                              controller
                                                                      .theOldNPrice =
                                                                  int.parse((snapshot
                                                                      .data[
                                                                          'data']
                                                                          [i][
                                                                          'old_price']
                                                                      .toString()));

                                                              controller
                                                                  .theNPrice = int.parse((snapshot
                                                                              .data[
                                                                          'data'][i]
                                                                      [
                                                                      'price_product'])
                                                                  .toString());

                                                              controller
                                                                  .theOldPrice = controller
                                                                      .theOldNPrice /
                                                                  12.1581
                                                                      .floor();
                                                              controller
                                                                  .thePrice = controller
                                                                      .theNPrice /
                                                                  12.1581
                                                                      .floor();
                                                              controller.product
                                                                      .KoldPrice =
                                                                  controller
                                                                      .theOldPrice
                                                                      .toString();
                                                              controller.product
                                                                      .KpricePro =
                                                                  controller
                                                                      .thePrice
                                                                      .toString();
                                                              homeController
                                                                  .viewTheDetilas
                                                                  .value = true;
                                                            },
                                                            child: Container(
                                                                width:
                                                                    screenHeight *
                                                                        0.16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .balckgray,
                                                                ),
                                                                child: Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            screenWidth *
                                                                                0.015),
                                                                    child: Text(
                                                                      ("95".tr),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.035,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ))),
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ),
                                                ),
                                              )));
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              1.3),
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0,
                                    ));
                              } else {
                                return Shimmer(
                                  duration:
                                      Duration(seconds: 45), //Default value
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
                            }))),
              ),
            ])),
          )),
    );
  }
}
