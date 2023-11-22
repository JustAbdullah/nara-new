import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/controllers/home_controller.dart';

class ss extends StatelessWidget {
  const ss({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.amber,
              body: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 600,
                      height: 300,
                      color: Colors.red,
                      child: InkWell(
                          onTap: () {
                            controller.ttt();
                          },
                          child:
                              Text("${controller.IDUserFromDataBase.value}"))),
                )
              ]),
            ));
  }
}
