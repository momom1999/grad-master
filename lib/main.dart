import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/firebase_options.dart';
import 'package:grad/home.dart';
import 'package:grad/core/register/register.dart';
import 'package:grad/provider/my_provider.dart';
import 'package:grad/screens/login_view.dart';
import 'package:grad/screens/provider_home.dart';
import 'package:grad/welcome_page.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
      create: (context)=> MyProvider(),
      child: MyApplication()));
}

class MyApplication extends StatefulWidget{




  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      title: 'Vezeeta',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Register.routeName: (_) => Register(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        ProviderHome.routeName:(_)=>ProviderHome(),
        WelcomePage.routeName:(_)=>WelcomePage(),
      },
      initialRoute: provider.firebaseUser!=null? HomeScreen.routeName
      :WelcomePage.routeName);

  }

}