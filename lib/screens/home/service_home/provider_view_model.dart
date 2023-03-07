import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';
import 'package:grad/model/updates.dart';
import 'package:grad/screens/home/service_home/provider_navigator.dart';

class ProviderHomeViewModel extends
BaseViewModel<ProviderHomeNavigator>{

  
  void AddUptadesToDB(
      String title,
      String description,
      String catId){
    Updates updates= Updates(title: title, description: description, catId: catId, imageURL: '');
    
    DataBaseUtils.AddUpdatesToFirestore(updates).then((value){
navigator!.CatogoryCreated();
      }).catchError((error){

    });
  }
  
  
}