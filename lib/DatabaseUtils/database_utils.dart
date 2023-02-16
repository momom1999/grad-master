
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/my_user.dart';

class DataBaseUtils {

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance.collection(MyUser.COLLECTION_NAME)
        .withConverter<MyUser>(fromFirestore: (snapshot,options)=>
        MyUser.fromJason(snapshot.data()!),
        toFirestore: (value,options)=>value.toJson(),);
  }
  static Future<void> AddUserToFirestore(MyUser myUser){


    return getUsersCollection().doc(myUser.id).set(myUser);
  }
  static Future <MyUser?> readUserFromFirestore(String id)async{
    DocumentSnapshot<MyUser> user=

    await getUsersCollection().doc(id).get();

    var myUser=user.data();
    return myUser;

  }
}