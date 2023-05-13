// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// import '../category_grid_view.dart';
// import '../category_list.dart';
//
// class CategoryList extends StatefulWidget {
//   Category category;
//
//   CategoryList(this.category);
//
//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }
//
//
// class _CategoryListState extends State<CategoryList> {
//
//   List Updates = [];
//   final clinicCollection = FirebaseFirestore.instance.collection("updates").where("imageURL", isEqualTo: "clinic");
//   getData() async {
//     var response = await clinicCollection.get();
//     response.docs.forEach((element) {
//       setState(() {
//         Updates.add(element.data());
//       });
//     });
//     print(Updates);
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   getImagesAndFolderName() async {
//     var ref = await FirebaseStorage.instance.ref("test/").listAll();
//
//     ref.items.forEach((element) {
//       print("======");
//       print(element.fullPath);
//     });
//
//     @override
//     void initState() {
//       getImagesAndFolderName();
//       super.initState();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       return ListView.builder(
//           itemCount: Updates.length,
//           itemBuilder: (context, i) {
//             return ListTile(
//               title: Text("${Updates[i]['catId']}"),
//               subtitle: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 verticalDirection: VerticalDirection.up,
//                 children: [
//                   //Text("${Updates[i]['catId']}"),
//                   Text("${Updates[i]['title']}"),
//                   Text("${Updates[i]['description']}"),
//                   Text("${Updates[i]['link']}"),
//                   Text("${Updates[i]['phone']}"),
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 20),
//                     child: CircleAvatar(
//                         radius: 80,
//                         backgroundImage: NetworkImage(
//                           "${Updates[i]['imageURL']}",
//                         )),
//                   )
//                 ],
//               ),
//             );
//           });
//     });
//   }
// }
//
// // ElevatedButton(
// //                       child:Text("${Updates[i]['link']}"),
// //
// //                       onPressed: () async{
// //                         final url= "${Updates[i]['link']}";
// //                       }),
