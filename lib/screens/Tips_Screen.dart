import 'package:flutter/material.dart';
import 'package:grad/home.dart';
import 'package:grad/screens/tipsWidget.dart';

class TipsScreen extends StatelessWidget {
  static const String routeName = 'tips';
  var tips = [
    "hi\n there",
    "hellovdfghhgsjhjzdbjzcnvkcnvbknxcbjnzcxknzkcnbkcxnkfghjuiuhygfds world",
    "omar ashraf"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }),
      ),
      body:Stack(children: <Widget>[
      Container(
      decoration: new BoxDecoration(
      image: new DecorationImage(
      image: new AssetImage("assets/images/background.png"),
      fit: BoxFit.cover,
    ),
    ),
    ),
      ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          itemBuilder: (context, index) {
            return tipsWidget(tips[index]);
          },
          itemCount: tips.length),

    ]));
  }
}
