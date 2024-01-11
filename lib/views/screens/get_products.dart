import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/constant/images_path.dart';
import 'package:nara_test/views/screens/the_types_all.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../../core/localization/changelanguage.dart';
import '../widgets/menu/menu.dart';
import '../widgets/textfiled/search_text_filed.dart';
import '../widgets/textfiled/textformfiled_cut.dart';
import '../widgets/types_products_widget/substype_widget.dart';
import '../widgets/types_products_widget/type_products_widget.dart';
import '../widgets/home_widgets/view_widget_products_home/details_products_widget.dart';
import '../widgets/types_products_widget/type_products_widget_searching.dart';
import '../widgets/types_products_widget/users_products.dart';
import 'get_prodcuts_list.dart';
import 'get_prodcuts_list_searching_name.dart';
import 'get_prodcuts_list_searching_type.dart';
import 'submaintypes.dart';

class TheAllTypes extends StatelessWidget {
  const TheAllTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.theMainColor,
          body: SafeArea(
              child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.to(TheTypesAll());
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
                                )),
                            InkWell(
                                onTap: () {
                                  Get.to(TheTypesAll());
                                },
                                child: GetX<ChangeLanguageToLocale>(
                                    builder: (scontroller) => Text(
                                          scontroller.changeLangData == 1
                                              ? controller.getNameMainType
                                              : controller.getNameMainTypeEn,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: const Color.fromARGB(
                                                  255, 47, 47, 47),
                                              fontSize: screenWidth * 0.053,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.09),
                            child: TextFormFiledCustomSearch(
                              labelData: "319".tr,
                              hintData: "320".tr,
                              iconData: controller.isSearchingText.value == true
                                  ? Icons.close
                                  : Icons.search,
                              controllerData: controller.searchingText,
                              value: (value) {
                                return value;
                              },
                              fillColor: AppColors.white,
                              hintColor: AppColors.yellow,
                              iconColor:
                                  controller.isSearchingText.value == true
                                      ? AppColors.WelcomeRed
                                      : AppColors.balckgray,
                              borderSideColor: AppColors.white,
                              onTap: () {
                                if (controller.isSearchingText.value == true) {
                                  controller.isSearchingText.value = false;
                                  controller.searchingText.clear();
                                } else {
                                  controller.isSearchingText.value = true;
                                }
                              },
                              fontColor: AppColors.balckgray,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              autofillHints: [AutofillHints.name],
                              onChanged: (value) {
                                controller.searcingText.value =
                                    value.toString();
                                return value;
                              },
                              validator: (p0) {},
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.03,
                            bottom: screenHeight * 0.00),
                        child: SizedBox(
                          height: screenHeight * 0.05,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.isSearchingType.value = false;
                                    },
                                    child: Container(
                                      height: screenHeight * 0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "321".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.002,
                                  ),
                                  MainSubTypes(),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.03,
                            bottom: screenHeight * 0.00),
                        child: SizedBox(
                          height: screenHeight * 0.65,
                          child: controller.isSearchingText.value == true
                              ? ViewTheProductsMainTypesName()
                              : controller.isSearchingType.value == true
                                  ? ViewTheProductsMainTypesNameType()
                                  : ViewTheProductsMainTypes(),
                        )),
                  ],
                ),
              ),
              DetailsProducts(),
            ],
          ))),
    );
  }
}
