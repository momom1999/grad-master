import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';
import 'package:grad/core/register/register_navigator.dart';
import 'package:grad/firebase_error.dart';
import 'package:grad/model/my_user.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {

String message="";
var auth= FirebaseAuth.instance;
  void createAccountWithFirebaseAuth(String email, String password,
      String firstName,String lastName) async {
    try {

      navigator!.showLoading();

      final credential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message="Account Created";
      MyUser myUser=MyUser(id: credential.user?.uid??"", fNAme: firstName, lName: lastName,
          email: email);
      DataBaseUtils.AddUserToFirestore(myUser).then((value) {

        navigator!.hideDialog();

        navigator!.goToHome(myUser);
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
