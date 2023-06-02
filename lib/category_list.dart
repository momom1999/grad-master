import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/database_utils.dart';
import 'package:grad/screens/home/service_home/thanks.dart';
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

        body:new Stack(
            children: <Widget>[
        new Container(
        decoration: new BoxDecoration(
        image: new DecorationImage(
        image: new AssetImage("assets/images/background.png"),
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
                            Image.file(
                              File(
                                doc!['imageURL'],
                              ),
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            // ClipRRect(
                            //
                            //   child: CachedNetworkImage(
                            //
                            //
                            //     height: 200,
                            //     width: double.infinity,
                            //
                            //
                            //     imageUrl: (doc!['imageURL']),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 5,
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              verticalDirection: VerticalDirection.up,
                              children: [
                                //Text("${Updates[i]['catId']}"),
                                Text(doc['description']), Text(doc['title']),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        final Uri url = Uri(
                                          scheme: "tel",
                                          path: (doc['phone']),
                                        );
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          print("can not launch this url");
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.phone,
                                      ),
                                      label: const Text("Calling        "),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff072948)),
                                      ),
                                    ),
                                    IconButton(
                                        icon: const Icon(
                                          Icons.whatsapp,
                                          size: 30,
                                        ),
                                        color: Colors.green.shade800,
                                        onPressed: () {
                                          {
                                            sendWhatsAppMessage(
                                                phone: doc['phone'],
                                                message: '');
                                          }
                                        }),
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        final httpsUri = Uri(
                                          scheme: "https",
                                          path: (doc['link']),
                                        );
                                        if (await canLaunchUrl(httpsUri)) {
                                          await launchUrl(httpsUri);
                                        } else {
                                          print("can not launch this url");
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.link,
                                      ),
                                      label: const Text("Link       "),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff072948)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ]),
                    );
                  }));
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
