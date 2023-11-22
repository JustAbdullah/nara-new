import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';

class VeiwHomeBrands extends StatelessWidget {
  const VeiwHomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getAllDataBrands(),
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
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    homeController.Thebrand.nameBrand =
                        snapshot.data['data'][i]['name_brand_ar'].toString();
                    homeController.Thebrand.nameBrandEn =
                        snapshot.data['data'][i]['name_brand_en'].toString();

                    homeController.Thebrand.ImageBrand =
                        snapshot.data['data'][i]['image_brand'].toString();

                    homeController.Thebrand.idBrand =
                        snapshot.data['data'][i]['id_brand'].toString();

                    homeController.ind = snapshot.data['data'].length;

                    return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        child: InkWell(
                            onTap: () async {
                              homeController.Thebrand.nameBrand = snapshot
                                  .data['data'][i]['name_brand_ar']
                                  .toString();
                              homeController.Thebrand.nameBrandEn = snapshot
                                  .data['data'][i]['name_brand_en']
                                  .toString();

                              homeController.Thebrand.ImageBrand = snapshot
                                  .data['data'][i]['image_brand']
                                  .toString();

                              homeController.Thebrand.idBrand = snapshot
                                  .data['data'][i]['id_brand']
                                  .toString();
                            },
                            child: Container(
                              color: AppColors.white,
                              /*   decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 210, 209, 209),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),*/
                              child: Stack(children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.00),
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: screenWidth * 0.45,
                                        height: screenHeight * 0.15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(7),
                                                bottomLeft:
                                                    Radius.circular(7))),
                                        child: CachedNetworkImage(
                                          width: screenWidth * 0.45,
                                          height: screenHeight * 0.15,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              ("${snapshot.data['data'][i]['image_brand'].toString()}"),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(7),
                                                  bottomLeft:
                                                      Radius.circular(7)),
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
                                                AppColors.WelcomeRed,
                                              )),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
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
                                          child: GetX<ChangeLanguageToLocale>(
                                            builder: (scontroller) =>
                                                scontroller.changeLangData == 1
                                                    ? Text(
                                                        ("${snapshot.data['data'][i]['name_brand_ar'].toString()}"),
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .balckgray,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.042,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                      )
                                                    : Text(
                                                        ("${snapshot.data['data'][i]['name_brand_en'].toString()}"),
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .balckgray,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.042,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                      ),
                                          ),
                                        ))),
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
          } else if (homeController.isNotInternet.value == true) {
            return Center();
          } else {
            return Shimmer(
              duration: Duration(seconds: 45), //Default value
              interval:
                  Duration(seconds: 45), //Default value: Duration(seconds: 0)
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
        });
  }
}
