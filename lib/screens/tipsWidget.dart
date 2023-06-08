import 'package:flutter/material.dart';

class tipsWidget extends StatelessWidget {
  String tips;
tipsWidget(this.tips);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF000A32), borderRadius: BorderRadius.circular(5)),
      child: 
          Expanded(
            child: Padding(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Text(
                maxLines: 10,
                 tips,style:TextStyle( fontSize: 18,color:Colors.white),
              ),
            ),
          ),
    );

  }
}
