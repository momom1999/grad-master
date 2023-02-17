import 'package:flutter/material.dart';
import 'package:grad/core/register/register.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName='welcomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vezzeta'),
        centerTitle: true,),

      body: Column(
        children: [SizedBox(height: 50,),
          Text('Welcome',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),),
          Text('You are a ?',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
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
