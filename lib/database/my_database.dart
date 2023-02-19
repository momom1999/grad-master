// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:grad/database/supplier_provider.dart';
//
// class MyDatabase{
//   static CollectionReference<SupplierProvider>getsupplierProviderCollection(){
//     var supplierProciderCollection=
//     FirebaseFirestore.instance.collection('supplierProvider').
//     withConverter<SupplierProvider>(fromFirestore: (snapshot,options)=> SupplierProvider
//         .fromFireStore(snapshot.data()!),
//         toFirestore:(supplierProvider,options)=> supplierProvider.toFireStore());
//     return supplierProciderCollection;
//   }
//   static void insertSupplierProviderData(SupplierProvider supplierProvider){
//
//     var supplierProviderCollection=getsupplierProviderCollection();
//     supplierProviderCollection.add(supplierProvider);
//
//
//   }
// }