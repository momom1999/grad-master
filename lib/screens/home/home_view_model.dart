import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';

import '../../model/updates.dart';

class HomeViewModel extends BaseViewModel{

  List<Updates> updates=[];
  void readUpdates(){
   DataBaseUtils.readUpdatesFromFirestore().then((value) {
     updates = value;
   }).catchError((error){
     navigator!.showMessage(error.toString());
   });




  }

}