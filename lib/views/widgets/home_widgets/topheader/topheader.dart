import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/appcolors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TopHeader extends StatelessWidget {
  TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;
    return Container(
      width: screenWidth,
      height: screenHeight / 12,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "294".tr,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: AppColors.yellow,
                        fontSize: screenWidth * 0.052,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Align(
                  alignment: Alignment.center,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          "295".tr,
                        ),
                        FadeAnimatedText("296".tr),
                        FadeAnimatedText("297".tr),
                      ],
                      totalRepeatCount: 1000000000,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      onTap: () {},
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
