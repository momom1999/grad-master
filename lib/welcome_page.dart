import 'package:flutter/material.dart';
import 'package:grad/core/register/register.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName='welcomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Colors.teal,title: Text('Paws',),
        centerTitle: true,),

      body: Column(
        children: [SizedBox(height: 50,),
          Text('Welcome',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),),
          SizedBox(height: 20,),
          Text('Please select who you are',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              ElevatedButton(child: const Text('Client', style: TextStyle(fontSize: 24.0),),
                  onPressed: () {_navigateToNextScreen(context);}),

              ElevatedButton(child: const Text('Service Provider', style: TextStyle(fontSize: 24.0),),
                  onPressed: () {_navigateToNextScreen(context);}),
            ],
          ),
        ],
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
  }
}
