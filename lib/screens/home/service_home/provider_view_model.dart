import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/base.dart';
import 'package:grad/model/updates.dart';
import 'package:grad/screens/home/service_home/provider_navigator.dart';

class ProviderHomeViewModel extends BaseViewModel<ProviderHomeNavigator> {
  void AddUptadesToDB(String title,String address, String description, String catId,
      String link, String phone, String imageURL,) {
    Updates updates = Updates(
        title: title,
        address: address,
        description: description,
        catId: catId,
        link: link,
        phone: phone,
        imageURL: imageURL);

    DataBaseUtils.AddUpdatesToFirestore(updates).then((value) {
      navigator!.CatogoryCreated();
    }).catchError((error) {});
  }
}
