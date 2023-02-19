import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';

import '../../../model/service_provider.dart';
import 'login_serviceprovider_navigator.dart';


class LoginServiceProviderViewModel extends BaseViewModel<LoginServiceProviderNavigator> {
  var auth = FirebaseAuth.instance;
  String message='';

  void loginServiceProviderWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();

      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message="Login Succesfully";
      ServiceProvider? serviceProvider= (await DataBaseUtils.readUserFromFirestore(credential.user?.uid??"")) as ServiceProvider?;

      if(serviceProvider!=null){
        navigator!.hideDialog();
        navigator!.goToHome(serviceProvider);
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
