import 'package:firebase_auth/firebase_auth.dart';

import 'package:grad/DatabaseUtils/service_provider_database.dart';
import 'package:grad/base.dart';
import 'package:grad/core/service_provider_registration/service_provider_navigator.dart';
import 'package:grad/firebase_error.dart';

import '../../model/service_provider.dart';

class ServiceProviderRegisterViewModel extends BaseViewModel<ServiceProviderRegisterNavigator> {

String message="";
var auth= FirebaseAuth.instance;
  void createServiceProviderAccountWithFirebaseAuth(String email, String password,
      String Name) async {
    try {

      navigator!.showLoading();

      final credential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message="Account Created";
      ServiceProvider serviceProvide= ServiceProvider(id: credential.user?.uid??"", Name: Name, email: email);
      DataBaseServiceProviderUtils.AddServiceProvideToFirestore(serviceProvide)
          .then((value) {
        navigator!.hideDialog();
        navigator!.goToHome(serviceProvide);
        return;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {

      message="The password provided is too weak";

      } else if (e.code == FirebaseError.emailInUse) {
        message = "This account is already exists for that email";
      }
    } catch (e) {
      message="Something went wrong $e";

    }
    if(message!=""){
      navigator!.hideDialog();
      navigator!.showMessage(message);
  }
}}
