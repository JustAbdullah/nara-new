import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nara_test/controllers/home_controller.dart';

class TestingNNNN extends StatelessWidget {
  const TestingNNNN({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () async {
              XFile? xfile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              File myfile = File(xfile!.path);

              await Future.delayed(Duration(seconds: 10), () async {
                homeController.upIm(myfile);
              });
            },
            child: Container(
                width: 400,
                height: 600,
                color: Colors.red,
                child: Text("Choes Image now ")),
          ),
        )
      ]),
    );
  }
}
