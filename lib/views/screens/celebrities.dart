import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nara_test/views/widgets/celebrities/view_the_celeb.dart';

import '../../../../core/constant/appcolors.dart';
import '../../controllers/home_controller.dart';
import '../../core/constant/images_path.dart';
import '../../core/localization/changelanguage.dart';
import '../widgets/celebrities/celebrities.details.dart';
import '../widgets/celebrities/view_celeb_searching.dart';
import '../widgets/menu/menu.dart';
import '../widgets/textfiled/textformfiled_cut.dart';
import '../widgets/home_widgets/view_widget_products_home/details_products_widget.dart';

class Celebrities extends StatelessWidget {
  const Celebrities({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    color: AppColors.offerColor,
                    child: Stack(children: [
                      Padding(
                          padding: EdgeInsets.only(top: screenWidth * 0.07),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: GetX<ChangeLanguageToLocale>(
                                  builder: (scontroller) =>
                                      scontroller.changeLangData == 1
                                          ? Text(
                                              controller.nameOFClebsAr.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.055,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(
                                              controller.nameOFClebsEn.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: AppColors
                                                      .blackNumberFourBlackMode,
                                                  fontSize: screenWidth * 0.055,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            )))),
                      Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.10),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.09),
                              child: TextFormFiledCus(
                                keyboardType: TextInputType.name,
                                autofillHints: [AutofillHints.name],
                                obscureText: false,
                                controllerData: controller.searchingTheCelebs,
                                value: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  controller.TheNameCelebsToSearching.value =
                                      value.toString();
                                  controller.isTheUserIsWantSearhingCelebs
                                      .value = true;

                                  return null;
                                },
                                onChanged: (val) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  controller.TheNameCelebsToSearching.value =
                                      val.toString();
                                  controller.isTheUserIsWantSearhingCelebs
                                      .value = true;

                                  return null;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "13".tr;
                                  }
                                  return value.length > 20 ? "13".tr : null;
                                },
                                hintData: "148".tr,
                                iconData: Icons.search,
                                labelData: "148".tr,
                                fillColor: Colors.white,
                                iconColor: AppColors.blackNumberFourBlackMode,
                                hintColor: AppColors.theMainOfColor,
                                fontColor: AppColors.blackNumberFourBlackMode,
                                borderSideColor: Colors.white,
                              ),
                            ),
                          )),
                      Visibility(
                        visible: controller.isTheUserIsWantSearhingCelebs.value,
                        child: Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.11),
                            child: InkWell(
                              onTap: () {
                                controller.isTheUserIsWantSearhingCelebs.value =
                                    false;
                                controller.searchingTheCelebs.clear();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.09),
                                      child: Image.asset(
                                        "${ImagesPath.closeTheStatus}",
                                        width: screenWidth * 0.1,
                                      )),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.18),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child:
                              controller.isTheUserIsWantSearhingCelebs.value ==
                                      false
                                  ? view_the_celeb()
                                  : viewTheCelebSearching(),
                        ),
                      ),
                      Menu(),
                    ])),
              ),
            ));
  }
}
