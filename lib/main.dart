import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/core/service_provider_registration/service_registration.dart';
import 'package:grad/core/theme.dart';
import 'package:grad/firebase_options.dart';
import 'package:grad/home.dart';
import 'package:grad/core/register/register.dart';
import 'package:grad/provider/my_provider.dart';
import 'package:grad/screens/home/login_sevice_provider/login_serviceprovider.dart';
import 'package:grad/screens/login_view.dart';
import 'package:grad/screens/provider_home.dart';
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
      theme: MyTheme.lightTheme,
      title: 'Paws',

      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Register.routeName: (_) => Register(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        LoginServiceProvider.routeName:(_)=>LoginServiceProvider(),
        ProviderHome.routeName:(_)=>ProviderHome(),
        ServiceProviderRegister.routeName:(_)=>ServiceProviderRegister(),
      },
      initialRoute: provider.firebaseUser!=null? HomeScreen.routeName
      :LoginScreen.routeName);


  }

}