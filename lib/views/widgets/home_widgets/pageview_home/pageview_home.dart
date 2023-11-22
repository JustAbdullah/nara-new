import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nara_test/core/constant/images_path.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';

class PageViewHome extends StatelessWidget {
  const PageViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Container(
              width: screenWidth,
              height: screenHeight * 0.20,
              color: Colors.white,
              child: PageView(
                  onPageChanged: (val) {
                    controller.onPageChange(val.obs);
                  },
                  controller: homeController.ThepageController,
                  children: [
                    //////////////One From Api//////////////////////
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.25,
                      color: Colors.white,
                      child: Stack(children: [
                        Positioned(
                          child: controller.offerNumberOneIamgeArModeLight
                                          .value ==
                                      "" ||
                                  controller.offerNumberOneIamgeArModeLight
                                          .value.length ==
                                      0
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ("293".tr),
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors.balckgray,
                                          fontSize: screenWidth * 0.042,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.00,
                                      ),
                                      Lottie.asset(("${ImagesPath.internet}"),
                                          width: screenWidth * 0.3)
                                    ],
                                  ),
                                )
                              : CachedNetworkImage(
                                  width: screenWidth,
                                  height: screenHeight,
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      ("${controller.offerNumberOneIamgeArModeLight.value}"),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                        AppColors.WelcomeRed,
                                      )),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                        ),
                      ]),
                    ),

                    /////////////// Two from Api ///////////////////
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.fill,
                        imageUrl:
                            ("${controller.offerNumberTwoIamgeArModeLight.value}"),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: 15,
                          height: 15,
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.WelcomeRed,
                            )),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),

                    /////////////// Three from Api ///////////////////
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.fill,
                        imageUrl:
                            ("${controller.offerNumberThreeIamgeArModeLight.value}"),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: 15,
                          height: 15,
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.WelcomeRed,
                            )),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),

                    /////////////// Four from Api ///////////////////
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.fill,
                        imageUrl:
                            ("${controller.offerNumberFourIamgeArModeLight.value}"),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: 15,
                          height: 15,
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.WelcomeRed,
                            )),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),

                    //////////////////////////////// One static////////////////
                  ]),
            ));
  }
}
