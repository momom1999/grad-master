import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
 static const String routeName='thanks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Paws"),centerTitle: true,),
      
      body: new Stack(children: <Widget>[

      new Container(
      decoration: new BoxDecoration(
      image: new DecorationImage(
      image: new AssetImage("assets/images/background.png"),
      fit: BoxFit.cover,
    ),
    ),
    ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank You',textAlign:TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 45,color:Color(0xFF000A32),),),
          ],
        )
    ],
      )
    );
    
  }
}
