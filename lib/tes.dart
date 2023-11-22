import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: screenWidth * 0.3,
                  height: screenHeight / 22,
                  color: Colors.cyan,
                  child: Center(
                    child: Text(
                      "CLICKING",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
