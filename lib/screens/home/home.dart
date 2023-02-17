import 'package:flutter/material.dart';
import 'package:grad/base.dart';
import 'package:grad/model/my_user.dart';
import 'package:grad/screens/home/home_navigator.dart';
import 'package:grad/screens/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="Home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen,
HomeViewModel> implements HomeNavigator{
  @override
  void initState() {
    // TODO: implement initState

    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Paws"),),
        body: Container(),

    );
  }

  @override
  HomeViewModel initViewModel() {
   return HomeViewModel();
  }

  @override
  void goToHome(MyUser myUser) {
    // TODO: implement goToHome
  }
}
