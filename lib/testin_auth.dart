import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/controllers/home_controller.dart';

class TestingAuth extends StatelessWidget {
  const TestingAuth({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              homeController.signInWithGoogle();
            },
            child: Container(
                width: 300,
                height: 400,
                color: Colors.red,
                child: Center(
                  child: Text("Login Google"),
                )),
          ),
        )
      ]),
    );
  }
}
