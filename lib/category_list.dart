import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'category_grid_view.dart';

class CategoryList extends StatefulWidget {
  Category category;
  CategoryList(this.category);
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List Updates = [];
  CollectionReference Updatesref =
      FirebaseFirestore.instance.collection("Updates");
  getData() async {
    var response =
        await Updatesref.where("imageURL", isEqualTo: "shelter").get();

    response.docs.forEach((element) {
      setState(() {
        Updates.add(element.data());
      });
    });
    print(Updates);
  }

  @override
  void initState() {
    getData();

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

    return Builder(builder: (context) {
      return ListView.builder(

          itemCount: Updates.length,
          itemBuilder: (context, category) {
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
                        width:double.infinity,

                        imageUrl:("${Updates[category]['phone']}") ,

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
                        Text("${Updates[category]['title']}"),
                        Text("${Updates[category]['description']}"),
                        Text("${Updates[category]['link']}"),
                      ],
                    ),
                  ]),
            );
          });
    });
  }
}
