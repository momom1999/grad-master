import 'package:grad/base.dart';
import 'package:grad/model/my_user.dart';

abstract class LoginNavigator extends BaseNavigator{

  void goToHome(MyUser myUser);

}