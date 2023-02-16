import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/model/my_user.dart';

class MyProvider extends ChangeNotifier{
  MyUser? myUser;
  User? firebaseUser;

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initMyUser();

    }

  }
  void initMyUser()async{
    myUser=await DataBaseUtils.readUserFromFirestore(firebaseUser?.uid??"");
  }
}