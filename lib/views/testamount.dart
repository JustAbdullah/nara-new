import 'package:flutter/material.dart';

class testingAmount extends StatefulWidget {
  const testingAmount({super.key});

  @override
  State<testingAmount> createState() => _testingAmountState();
}

class _testingAmountState extends State<testingAmount> {
  String totail = "4000";
  String amount = "1200";
  int theA = 0;
  String m = "0";
  String d = "0";
  void getAmount() {
    d = ((double.tryParse(totail.toString())! * 0.10) + int.parse(amount))
        .toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("العدد"),
        InkWell(
          onTap: () {
            getAmount();

            setState(() {});
          },
          child: Container(
            color: Colors.red,
            width: 300,
            height: 100,
            child: Text("الضغط"),
          ),
        ),
        Text(d),
      ],
    ));
  }
}
