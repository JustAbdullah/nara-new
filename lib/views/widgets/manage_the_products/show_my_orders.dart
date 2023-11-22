import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/localization/changelanguage.dart';

class ShowMyOrdersUserd extends StatelessWidget {
  const ShowMyOrdersUserd({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheMyOrdersByUSers.value,
            child: Scaffold(
                body: SafeArea(
                    child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: Colors.white,
                        child: Stack(children: [
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
                                        controller.showTheMyOrdersByUSers
                                            .value = false;
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
                                      onTap: () {},
                                      child: Text(
                                        "طلبيات العملاء".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: const Color.fromARGB(
                                                255, 47, 47, 47),
                                            fontSize: screenWidth * 0.043,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.06),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "طلبيات العملاء".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color:
                                            AppColors.blackNumberFourBlackMode,
                                        fontSize: screenWidth * 0.054,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ))),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.11),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * 0.70,
                                color: Colors.white,
                                child: FutureBuilder(
                                  future:
                                      controller.getOrdersProductsTheUsers(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (controller.emtpyTheOrdersUsers.value ==
                                        false) {
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

                                            controller
                                                    .cartShop.quantitysProduct =
                                                "${snapshot.data['data'][i]['quantity'].toString()}";

                                            controller.cartShop.bodyPro =
                                                "${snapshot.data['data'][i]['body_product'].toString()}";

                                            controller.cartShop.bodyProEn =
                                                snapshot.data['data'][i]
                                                        ['body_product_en']
                                                    .toString();

                                            controller.cartShop
                                                    .statusshoppingcart =
                                                snapshot.data['data'][i]
                                                        ['status_shopping_cart']
                                                    .toString();

                                            controller.cartShop
                                                .idOfOrder = snapshot.data[
                                                    'data'][i]
                                                    ['id_order_shopping_cart']
                                                .toString();
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {});

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenHeight * 0.01,
                                                  bottom: screenHeight * 0.00),
                                              child: InkWell(
                                                onTap: () {},
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 1200),
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .theMainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  width: screenWidth,
                                                  height: screenHeight * 0.12,
                                                  child: Stack(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                left:
                                                                    screenWidth *
                                                                        0.00,
                                                                right:
                                                                    screenWidth *
                                                                        0.00),
                                                            child:
                                                                CachedNetworkImage(
                                                              width:
                                                                  screenWidth *
                                                                      0.24,
                                                              height:
                                                                  screenHeight *
                                                                      0.12,
                                                              fit: BoxFit
                                                                  .contain,
                                                              imageUrl:
                                                                  ("${controller.cartShop.imagePro}"),
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
                                                                        .theMainColor,
                                                                  )),
                                                                ),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                                child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  top:
                                                                      screenHeight *
                                                                          0.02,
                                                                  right:
                                                                      screenWidth *
                                                                          0.27,
                                                                  left:
                                                                      screenWidth *
                                                                          0.27),
                                                              child: GetX<
                                                                      ChangeLanguageToLocale>(
                                                                  builder: (scontroller) =>
                                                                      scontroller.changeLangData ==
                                                                              1
                                                                          ? Text(
                                                                              ("${controller.cartShop.namePro}"),
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.042, fontWeight: FontWeight.w700),
                                                                              textAlign: TextAlign.center,
                                                                            )
                                                                          : Text(
                                                                              ("${controller.cartShop.nameProEn}"),
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.042, fontWeight: FontWeight.w700),
                                                                              textAlign: TextAlign.center,
                                                                            )),
                                                            ))),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.05,
                                                                      right: screenWidth *
                                                                          0.21,
                                                                      left: screenWidth *
                                                                          0.21),
                                                                  child:
                                                                      Container(
                                                                          width: screenWidth *
                                                                              0.47,
                                                                          child:
                                                                              GetX<ChangeLanguageToLocale>(
                                                                            builder: (scontroller) => scontroller.changeLangData == 1
                                                                                ? Text(
                                                                                    ("${controller.cartShop.bodyPro}"),
                                                                                    style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.042, fontWeight: FontWeight.w400),
                                                                                    maxLines: 1,
                                                                                    textAlign: TextAlign.center,
                                                                                  )
                                                                                : Text(
                                                                                    ("${controller.cartShop.bodyProEn}"),
                                                                                    style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.042, fontWeight: FontWeight.w400),
                                                                                    maxLines: 1,
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                          ))),
                                                            )),
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
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                          .deleteFromShoppingCart(
                                                                              "${snapshot.data['data'][i]['id_shoppingCart'].toString()}");
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: screenWidth *
                                                                          0.19,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .red,
                                                                          borderRadius:
                                                                              BorderRadius.circular(0)),
                                                                      child:
                                                                          Text(
                                                                        "231"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize: screenWidth *
                                                                                0.040,
                                                                            fontWeight:
                                                                                FontWeight.w400),
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
                                                              )),
                                                        )),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Container(
                                                          child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  top:
                                                                      screenHeight *
                                                                          0.04,
                                                                  left:
                                                                      screenWidth *
                                                                          0.04,
                                                                  right:
                                                                      screenWidth *
                                                                          0.04),
                                                              child: Row(
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
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.047,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        screenWidth *
                                                                            0.004,
                                                                  ),
                                                                  Text(
                                                                    ("${controller.cartShop.totalPrice}"),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.047,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              )),
                                                        )),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                          child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  top:
                                                                      screenHeight *
                                                                          0.07,
                                                                  right:
                                                                      screenWidth *
                                                                          0.05,
                                                                  left:
                                                                      screenWidth *
                                                                          0.05),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "82".tr,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.043,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        screenWidth *
                                                                            0.002,
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        screenWidth *
                                                                            0.04,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .red,
                                                                        borderRadius:
                                                                            BorderRadius.circular(0)),
                                                                    child: Text(
                                                                      "${snapshot.data['data'][i]['quantity_cart'].toString()}",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: screenWidth *
                                                                              0.043,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        )),
                                                  ]),
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
                            ),
                          )
                        ]))))));
  }
}
