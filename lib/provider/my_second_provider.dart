import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';

import '../model/service_provider.dart';

class MyProvider extends ChangeNotifier{
  ServiceProvider? serviceProvider;
  User? firebaseUser;

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initMyUser();

    }

  }
  void initMyUser()async{
    serviceProvider=(await DataBaseUtils.readUserFromFirestore(firebaseUser?.uid??"")) as ServiceProvider?;
  }
}


