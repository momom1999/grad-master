import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';
import 'package:grad/model/my_user.dart';
import 'package:grad/screens/login_navigator.dart';

import '../firebase_error.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;
  String message='';

  void loginWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();

      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message="Login Succesfully";
      MyUser? myUser= await DataBaseUtils.readUserFromFirestore(credential.user?.uid??"");

      if(myUser!=null){
        navigator!.hideDialog();
        navigator!.goToHome(myUser);
        return;
      }

    } on FirebaseAuthException catch (e) {
      message="Wrong Email or Password";

    } catch (e) {
      message="Something went wrong $e";
    }
    if(message!=""){
      navigator!.hideDialog();
      navigator!.showMessage(message);
    }
  }
}
