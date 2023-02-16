import 'package:grad/base.dart';
import 'package:grad/model/my_user.dart';

abstract class HomeNavigator extends BaseNavigator{

  void goToHome(MyUser myUser);
}