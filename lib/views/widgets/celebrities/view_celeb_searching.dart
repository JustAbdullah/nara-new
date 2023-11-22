import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/views/widgets/celebrities/celebrities.details.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';

class viewTheCelebSearching extends StatelessWidget {
  const viewTheCelebSearching({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return GetX<HomeController>(
        builder: (controller) => FutureBuilder(
              future: controller.getAllDataCelebsSearchingTypes(
                  controller.TheNameCelebsToSearching.value.toString()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data == null) {
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, i) {
                          homeController.celebs.nameCeleAr = snapshot
                              .data['data'][i]['name_celebrities']
                              .toString();
                          homeController.celebs.nameCeleEn = snapshot
                              .data['data'][i]['name_celebrities_en']
                              .toString();
                          ;
                          homeController.celebs.ImageCele = snapshot
                              .data['data'][i]['image_celebrities']
                              .toString();

                          homeController.ind = snapshot.data['data'].length;
                          /*   controller.product.typeOfPro =
                                    snapshot.data['data'][i]['id_product_type'];

                                controller.product.nameOfTypeProAr =
                                    snapshot.data['data'][i]['product_type_ar'];
                                controller.product.nameOfTypeProEn =
                                    snapshot.data['data'][i]['product_type'];

                                controller.product.idPro =
                                    snapshot.data['data'][i]['id_product'];

                                controller.product.namePro =
                                    snapshot.data['data'][i]['name_product'];

                                controller.product.nameProEn =
                                    snapshot.data['data'][i]['name_product_en'];

                                controller.product.imagePro =
                                    snapshot.data['data'][i]['image_product'];

                                controller.product.quantityTheProduct =
                                    snapshot.data['data'][i]['quantity'];
                                controller.product.pricePro =
                                    snapshot.data['data'][i]['price_product'];
                                controller.product.bodyPro =
                                    snapshot.data['data'][i]['body_product'];
                                controller.product.bodyProEn =
                                    snapshot.data['data'][i]['body_product_en'];

                                controller.product.imageProtwo = snapshot
                                    .data['data'][i]['image_product_two'];

                                controller.product.imageProthree = snapshot
                                    .data['data'][i]['image_product_three'];
                                controller.product.imageProfour = snapshot
                                    .data['data'][i]['image_product_four'];

                                controller.product.haveTheProductXBigSize =
                                    snapshot.data['data'][i]['have_Xbig_size'];

                                controller.product.haveTheProductBigSize =
                                    snapshot.data['data'][i]['have_big_size'];
                                controller.product.haveTheProductMediumSize =
                                    snapshot.data['data'][i]
                                        ['have_medium_size'];
                                controller.product.haveTheProductSmallSize =
                                    snapshot.data['data'][i]['have_small_size'];

//////
                                controller.product.haveTheProductBlackcolor =
                                    snapshot.data['data'][i]
                                        ['have_black_color'];
                                controller.product.haveTheProductWhitecolor =
                                    snapshot.data['data'][i]
                                        ['have_white_color'];
                                controller.product.haveTheProductYellowcolor =
                                    snapshot.data['data'][i]
                                        ['have_yellow_color'];
                                controller.product.haveTheProductOrangecolor =
                                    snapshot.data['data'][i]
                                        ['have_orange_color'];

                                controller.product.haveTheProductRedcolor =
                                    snapshot.data['data'][i]['have_red_color'];
                                controller.product.haveTheProductBluecolor =
                                    snapshot.data['data'][i]['have_blue_color'];
                                controller.product.haveTheProductGreencolor =
                                    snapshot.data['data'][i]
                                        ['have_green_color'];
                                controller.product.haveTheProductPurplecolor =
                                    snapshot.data['data'][i]
                                        ['have_purple_color'];

                                ///

                                ///

                                controller.product.pricePro =
                                    snapshot.data['data'][i]['price_product'];
                                controller.product.quantityTheProduct =
                                    snapshot.data['data'][i]['quantity'];*/

                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: InkWell(
                                  onTap: () async {
                                    homeController.celebs.nameCeleAr = snapshot
                                        .data['data'][i]['name_celebrities']
                                        .toString();
                                    homeController.celebs.nameCeleEn = snapshot
                                        .data['data'][i]['name_celebrities_en']
                                        .toString();
                                    ;
                                    homeController.celebs.ImageCele = snapshot
                                        .data['data'][i]['image_celebrities']
                                        .toString();

                                    homeController.celebs.idCele = snapshot
                                        .data['data'][i]['id_celebrities']
                                        .toString();

                                    homeController.getDataCollections(snapshot
                                        .data['data'][i]['id_celebrities']
                                        .toString());

                                    Get.to(CelebritiesDetails());
                                  },
                                  child: Container(
                                    color: AppColors.theMainColor,
                                    /*   decoration: BoxDecoration(
                                color: Color.fromARGB(255, 210, 209, 209),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),*/
                                    child: Stack(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.00),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth * 0.45,
                                              height: screenHeight * 0.15,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                          255, 212, 208, 208)
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  7),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  7))),
                                              child: CachedNetworkImage(
                                                width: screenWidth * 0.45,
                                                height: screenHeight * 0.15,
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    ("${snapshot.data['data'][i]['image_celebrities'].toString()}"),
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(7),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    7)),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
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
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: screenWidth * 0.00),
                                            child: Container(
                                              width: screenWidth * 0.30,
                                              child: GetX<
                                                      ChangeLanguageToLocale>(
                                                  builder: (scontroller) =>
                                                      scontroller.changeLangData ==
                                                              1
                                                          ? Text(
                                                              ("${snapshot.data['data'][i]['name_celebrities'].toString()}"),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .balckgray,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.042,
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
                                                              ("${snapshot.data['data'][i]['name_celebrities_en'].toString()}"),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .balckgray,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.042,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                            )),
                                            ),
                                          )),
                                    ]),
                                  )));
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.7),
                          crossAxisCount: 3,
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
              },
            ));
  }
}
