import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/service_provider.dart';

class DataBaseServiceProviderUtils {

  static CollectionReference<ServiceProvider> getServiceProvideCollection() {
    return FirebaseFirestore.instance.collection(ServiceProvider.COLLECTION_NAME)
        .withConverter<ServiceProvider>(fromFirestore: (snapshot,options)=>
        ServiceProvider.fromJason(snapshot.data()!),
      toFirestore: (value,options)=>value.toJson(),);
  }
  static Future<void> AddServiceProvideToFirestore(ServiceProvider serviceProvide){


    return getServiceProvideCollection().doc(serviceProvide.id).set(serviceProvide);
  }
  static Future <ServiceProvider?> readUserFromFirestore(String id)async{
    DocumentSnapshot<ServiceProvider> user=

    await getServiceProvideCollection().doc(id).get();

    var serviceProvide=user.data();
    return serviceProvide;

  }
}