import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../../core/localization/changelanguage.dart';
import '../widgets/menu/menu.dart';
import 'get_products.dart';
import 'package:shimmer/shimmer.dart';

class TheTypesAll extends StatelessWidget {
  const TheTypesAll({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [],
              ),
              SizedBox(
                height: screenHeight / 1.1,
                child: FutureBuilder(
                  future: homeController.getAllTheTypes(),
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
                        return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, i) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: InkWell(
                                      onTap: () async {
                                        homeController.getNameMainType =
                                            snapshot.data['data'][i]
                                                    ['type_name_ar']
                                                .toString();
                                        homeController.getNameMainTypeEn =
                                            snapshot.data['data'][i]
                                                    ['type_name_en']
                                                .toString();

                                        homeController.getIdMainType = snapshot
                                            .data['data'][i]['id_type']
                                            .toString();
                                        Get.to(TheAllTypes());
                                      },
                                      child: Container(
                                        width: screenWidth,
                                        height: screenHeight * 0.20,
                                        child: Stack(children: [
                                          CachedNetworkImage(
                                            width: screenWidth,
                                            height: screenHeight * 0.20,
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                ("${snapshot.data['data'][i]['image'].toString()}"),
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

                                          ////////////////

                                          ///////////////////
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.10,
                                                    right: screenWidth * 0.05),
                                                child: Container(
                                                  width: screenWidth * 0.30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: AppColors.white,
                                                  ),
                                                  child: GetX<
                                                          ChangeLanguageToLocale>(
                                                      builder: (scontroller) =>
                                                          scontroller.changeLangData ==
                                                                  1
                                                              ? Text(
                                                                  ("${snapshot.data['data'][i]['type_name_ar'].toString()}"),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: AppColors
                                                                        .balckgray,
                                                                    fontSize:
                                                                        screenWidth *
                                                                            0.052,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                )
                                                              : Text(
                                                                  ("${snapshot.data['data'][i]['type_name_en'].toString()}"),
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: AppColors
                                                                        .balckgray,
                                                                    fontSize:
                                                                        screenWidth *
                                                                            0.052,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                )),
                                                ),
                                              )),
                                        ]),
                                      )));
                            });
                    } else {
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return Shimmer.fromColors(
                                baseColor: Color.fromARGB(31, 169, 167, 167),
                                highlightColor: AppColors.white,
                                enabled: true,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    child: InkWell(
                                        onTap: () async {},
                                        child: Container(
                                          width: screenWidth,
                                          height: screenHeight * 0.20,
                                          child: Stack(children: [
                                            Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.20,
                                              color: AppColors.balckgray,
                                            ),

                                            ////////////////

                                            ///////////////////
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: screenHeight * 0.10,
                                                      right:
                                                          screenWidth * 0.05),
                                                  child: Container(
                                                      width: screenWidth * 0.30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        color: AppColors.white,
                                                      ),
                                                      child: Text(
                                                        (""),
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .balckgray,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.052,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                )),
                                          ]),
                                        ))));
                          });
                    }
                  },
                ),
              ),
              Menu(),
            ],
          ),
        ),
      ),
    );
  }
}
