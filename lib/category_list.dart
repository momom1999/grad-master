import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/screens/home/service_home/thanks.dart';
import 'package:grad/screens/serviceDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'category_grid_view.dart';
import 'model/updates.dart';
import 'model/updates.dart';

class CategoryList extends StatefulWidget {
  Category category;

  CategoryList(this.category);

  Future<void> _launchLinkUrl(String? link) async {
    _launchURL() async {
      final Uri weblink = Uri.parse('https://flutter.dev$link');
      if (!await launchUrl(weblink)) {
        throw Exception('Could not launch $weblink');
      }
    }
  }

  Future<void> _launchUrl(String? phoneNumber) async {
    final Uri whatsApp = Uri.parse("whatsapp://send?phone=+2$phoneNumber");
    if (!await launchUrl(whatsApp)) {
      throw Exception('Could not launch $whatsApp');
    }
  }

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
    return Scaffold(

        body:Stack(
            children: <Widget>[
        Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
      fit: BoxFit.cover,
    ),
    ),
    ),
    FutureBuilder(
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
                      Card(

                      elevation: 50,
                      clipBehavior: Clip.hardEdge,
                      color: const Color.fromRGBO(0, 10, 50, 500),
                      child: SizedBox(
                      width: double.infinity,
                      // height: 350,
                      child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [


                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(context, serviceDetails.routeName,arguments:doc),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        File(
                                          doc!['imageURL'],
                                        ),
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),SizedBox(height: 5,),
                              Text(doc!['title'],style:TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 22)),
                      Row(
                        children: [
                          Icon(
                              Icons.location_on,
                              color: Colors.pink,
                              size: 24.0,
                          ),

                              Text(doc['address'],style:TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 16)),],),


                            ]
                    ),
                      ),
                    )
                    )

                    ]
                    ));}));
            })]));
  }

  void sendWhatsAppMessage({
    required String phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=+2$phone&text=$message";
      }
    }

    await canLaunch(url())
        ? launch(url())
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('There is no WhatsApp on your Device!')));
  }
}
