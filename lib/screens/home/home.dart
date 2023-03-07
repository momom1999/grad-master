import 'package:flutter/material.dart';
import 'package:grad/base.dart';
import 'package:grad/model/my_user.dart';
import 'package:grad/screens/home/home_navigator.dart';
import 'package:grad/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

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
    viewModel.readUpdates();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Scaffold(
        appBar: AppBar(
          title:Text("Paws"),),


          body: Consumer<HomeViewModel>(
            builder: (_,homeViewModel,c)
            {
              return ListView.builder
                (itemBuilder: (context,index){
                return Text(homeViewModel.updates[index].title);
              },itemCount: homeViewModel.updates.length,
              );
            },
          ),

      ),
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
