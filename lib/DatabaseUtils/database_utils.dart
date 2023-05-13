


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grad/model/updates.dart';

import '../model/my_user.dart';
import '../model/service_provider.dart';

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
    return myUser;}

  static CollectionReference<Updates> getCategoriesCollection() {
    return FirebaseFirestore.instance.collection(Updates.COLLECTION_NAME)
        .withConverter<Updates>(fromFirestore: (snapshot,options)=>
        Updates.fromJson(snapshot.data()!),
      toFirestore: (category,options)=>category.toJson(),);}

  static Future<void> AddUpdatesToFirestore(Updates updates){
    var collection = getCategoriesCollection();
    var docRef=collection.doc();
    updates.id=docRef.id;
    return docRef.set(updates);

  }

  static Future<List<Updates>> readUpdatesFromFirestore()async{
    QuerySnapshot<Updates> snapUpdates= await getCategoriesCollection().get();
  return snapUpdates.docs.map((doc) => doc.data()).toList();

  }


  static CollectionReference<ServiceProvider> getServiceProvideCollection() {
    return FirebaseFirestore.instance.collection(ServiceProvider.COLLECTION_NAME)
        .withConverter<ServiceProvider>(fromFirestore: (snapshot,options)=>
        ServiceProvider.fromJason(snapshot.data()!),
      toFirestore: (value,options)=>value.toJson(),);

  }
  static Future<void> AddServiceProvideToFirestore(ServiceProvider serviceProvide){


    return getServiceProvideCollection().doc(serviceProvide.id).set(serviceProvide);
  }
  static Future <ServiceProvider?> readServiceProviderFromFirestore(String id)async {
    DocumentSnapshot<ServiceProvider> serviceUser =

    await getServiceProvideCollection().doc(id).get();

    var serviceProvide = serviceUser.data();
    return serviceProvide;
  }


 // static Future<List<Updates>>getClinicUpdates(){
   // var resullt =  getCategoriesCollection()
     //   .where('catId',isEqualTo: 'clinic')
       // .get();

  }
  //static Future<List<Updates>>getShelterpdates(){
    //var resullt =  getCategoriesCollection()
      //  .where('catId',isEqualTo: 'shelter')
        //.get();}

  //static Future<List<Updates>>getStoreUpdates()async{
    //var resullt =  getCategoriesCollection()
      //  .where('catId',isEqualTo: 'store')
   //.get();
//}









  //}



