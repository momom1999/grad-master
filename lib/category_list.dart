import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/screens/home/service_home/thanks.dart';
import 'category_grid_view.dart';
import 'model/updates.dart';
import 'model/updates.dart';

class CategoryList extends StatefulWidget {
  Category category;

  CategoryList(this.category);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List UpdatesList = [];

  CollectionReference Updatesref =
      FirebaseFirestore.instance.collection("Updates");

  getData(String type) async {
    var response = await Updatesref.where("catId", isEqualTo: type).get();
    //if (isEqualTo:tips)Navigator.pushNamed(context, Thanks.routeName);


    response.docs.forEach((element) {
      setState(() {
        UpdatesList.add(element);
      });
    });
    print(UpdatesList);
  }

  @override
  void initState() {
    getData("");

    super.initState();
  }

  getImagesAndFolderName() async {
    var ref = await FirebaseStorage.instance.ref("test/").listAll();

    ref.items.forEach((element) {
      print("======");
      print(element.fullPath);
    });

    @override
    void initState() {
      getImagesAndFolderName();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataBaseUtils.getClinicUpdates(widget.category.categoryID),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("erorrrrrrrrrrrrrrrrrr");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: ((context, index) {
                var doc = snapshot.data?.docs[index];
                return Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          // borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            height: 200,
                            width: double.infinity,
                            imageUrl: (doc!['imageURL']),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          verticalDirection: VerticalDirection.up,
                          children: [
                            //Text("${Updates[i]['catId']}"),
                            Text(doc['title']),
                            Text(doc['description']),
                            Text(doc['link']),
                            Text(doc['phone']),
                          ],
                        ),
                      ]),
                );
              }));
        });
  }
}
