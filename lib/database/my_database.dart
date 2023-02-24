// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:grad/model/service_provider.dart';
//
//  class MyDatabase{
//    static CollectionReference<ServiceProvider>getserviceProviderCollection(){
//      var serviceProviderCollection=
//      FirebaseFirestore.instance.collection('serviceProvider').
//      withConverter<ServiceProvider>(fromFirestore: (snapshot,options)=> ServiceProvider
//          .fromFireStore(snapshot.data()!),
//          toFirestore:(supplierProvider,options)=> supplierProvider.toFireStore());
//      return serviceProviderCollection;
//    }
//    static void insertSupplierProviderData(ServiceProvider serviceProvider){
//
//      var supplierProviderCollection=getserviceProviderCollection();
//      supplierProviderCollection.add(serviceProvider);
//
//
//    }
//  }