// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:grad/model/updates.dart';
//
// class CategoryProvider with ChangeNotifier {
//   final Updates _firebaseUser = Updates(catId: 'catId', description: 'description', phone: 'phone', title: 'title', imageURL: 'imageURL', link: 'link');
//   DocumentSnapshot? doc;
//   DocumentSnapshot<Map<String, dynamic>>? updatesDetails;
//
//   String? selectedCategory;
//   Map<String, dynamic> formData = {};
//
//   setCategory(selectedCategory) {
//     this.selectedCategory = selectedCategory;
//     notifyListeners();
//   }
//
//
//
//   setCategorySnapshot(snapshot) {
//     doc = snapshot;
//     notifyListeners();
//   }
//
//
//
//   setFormData(data) {
//     formData = data;
//     notifyListeners();
//   }
//
//   getUserDetail() {
//     _firebaseUser.getUserData().then((value) {
//       updatesDetails= value as DocumentSnapshot<Map<String, dynamic>>;
//       notifyListeners();
//     });
//   }
//
//
// }