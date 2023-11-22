import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nara_test/views/widgets/menu/menu.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../widgets/brands_widget/brands_details_widget.dart';
import '../widgets/brands_widget/brands_list.dart';
import '../widgets/brands_widget/brands_search.dart';
import '../widgets/icon_manage_widget/icon_manage_widget.dart';
import '../widgets/textfiled/textformfiled_cut.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.theMainColor,
              body: SafeArea(
                  child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.04),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "114".tr,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontSize: screenWidth * 0.053,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
                            controllerData: controller.searchingTheBrands,
                            value: (value) {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: []);
                              controller.TheNameBrandsToSearching.value =
                                  value.toString();
                              controller.isTheUserIsWantSearhingBrands.value =
                                  true;

                              return null;
                            },
                            onChanged: (val) {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: []);
                              controller.TheNameBrandsToSearching.value =
                                  val.toString();
                              controller.isTheUserIsWantSearhingBrands.value =
                                  true;

                              return null;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "13".tr;
                              }
                              return value.length > 20 ? "13".tr : null;
                            },
                            hintData: "147".tr,
                            iconData: Icons.search,
                            labelData: "147".tr,
                            fillColor: Colors.white,
                            iconColor: AppColors.blackNumberFourBlackMode,
                            hintColor: AppColors.theMainOfColor,
                            fontColor: AppColors.blackNumberFourBlackMode,
                            borderSideColor: Colors.white,
                          ),
                        ),
                      )),
                  Visibility(
                    visible: controller.isTheUserIsWantSearhingBrands.value,
                    child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.11),
                        child: InkWell(
                          onTap: () {
                            controller.isTheUserIsWantSearhingBrands.value =
                                false;
                            controller.searchingTheBrands.clear();
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
                        child: controller.isTheUserIsWantSearhingBrands.value ==
                                false
                            ? ThrBrandsList()
                            : ThebrandsSearching()),
                  ),
                  IconTheManageWidget(),
                  BrandsTheDetailsWidget(),
                  Menu()
                ],
              )),
            ));
  }
}
