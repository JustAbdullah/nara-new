import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../../core/localization/changelanguage.dart';

class MainSubTypes extends StatelessWidget {
  const MainSubTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getAllTheProdutsWithMainSubTypes(
            homeController.getIdMainType.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return homeController.isNoSubData.value == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            width: screenWidth,
                            height: screenHeight * 0.05,
                            child: Container(
                                alignment: Alignment.centerRight,
                                width: screenWidth,
                                height: screenHeight * 0.05,
                                child: Text(
                                  "94".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Color(0xFFC70039),
                                      fontSize: screenWidth * 0.058,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )))
                      ])
                : Container(
                    width: screenWidth,
                    height: screenHeight * 0.05,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: InkWell(
                                onTap: () {
                                  homeController.isSearchingType.value = false;
                                  homeController.theTypeSearching = snapshot
                                      .data['data'][i]['id_subtype']
                                      .toString();
                                  homeController.isSearchingType.value = true;
                                },
                                child: Container(
                                    height: screenHeight * 0.10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color:
                                            homeController.theTypeSearching ==
                                                    snapshot.data['data'][i]
                                                            ['id_subtype']
                                                        .toString()
                                                ? Colors.pink
                                                : AppColors.yellow),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: screenHeight * 0.01),
                                      child: GetX<ChangeLanguageToLocale>(
                                        builder: (scontroller) => Text(
                                          scontroller.changeLangData == 1
                                              ? snapshot.data['data'][i]
                                                  ['name_subtype_ar']
                                              : snapshot.data['data'][i]
                                                  ['name_subtype_en'],
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: homeController
                                                          .theTypeSearching ==
                                                      snapshot.data['data'][i]
                                                              ['id_subtype']
                                                          .toString()
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                              ));
                        }),
                  );
          } else {
            return Container(
                width: screenWidth,
                height: screenHeight * 0.10,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Shimmer.fromColors(
                          baseColor: Color.fromARGB(31, 83, 82, 82),
                          highlightColor: AppColors.white,
                          enabled: true,
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(31, 83, 82, 82),
                                  highlightColor: AppColors.white,
                                  enabled: true,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: screenHeight * 0.10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.yellow),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      child: Center(
                                        child: Text(
                                          "يتم التحميل",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ))));
                    }));
          }
        });
  }
}
