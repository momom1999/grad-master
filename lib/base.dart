import 'package:flutter/material.dart';

abstract class BaseNavigator{
  void showLoading({String message});
  void showMessage(String message);
  void hideDialog();

}

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier{
  NAV? navigator=null;
}

abstract class BaseView<T extends StatefulWidget,
VM extends BaseViewModel>extends State<T>{
 late VM viewModel;

 VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  viewModel=initViewModel();
  }

 @override
 void hideDialog() {
   Navigator.pop(context);
 }


 @override
 void showLoading({String message="loading"}) {
   showDialog(context: context,
       builder: (context){

         return AlertDialog(
           title: Center(child: Row(
             children: [
               Text(message),
               CircularProgressIndicator(),
             ],
           ),),
         );
       });
 }

 @override
 void showMessage(String message) {
   showDialog(context: context, builder: (context) {
     return AlertDialog(
       content: Text(message),
     );
   },);
 }

}