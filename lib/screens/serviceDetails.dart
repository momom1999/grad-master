import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad/model/updates.dart';
import 'package:url_launcher/url_launcher.dart';

class serviceDetails extends StatefulWidget {
  static const String routeName = "service";

  @override
  State<serviceDetails> createState() => _serviceDetailsState();
}

class _serviceDetailsState extends State<serviceDetails> {
  @override
  Widget build(BuildContext context) {
    var service = ModalRoute.of(context)!.settings.arguments
        as QueryDocumentSnapshot<Object?>;
    return Scaffold(
      appBar: AppBar(title: Text(service.get("title").toString())),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            // verticalDirection: VerticalDirection.up,
            children: [
              Container(
                height: 300,
                alignment: Alignment.center,
                child: Image.file(
                  File(
                    service.get("imageURL"),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(service.get('description'),
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final Uri url = Uri(
                        scheme: "tel",
                        path: (service.get('phone')),
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
                    label: const Text("Phone"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff072948)),
                    ),
                  ),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(const Color(0xff072948)),
                      ),
                      onPressed: () {

                      },
                      child: Row(
                        children: [
                          IconButton(
                                icon: const Icon(
                                  Icons.whatsapp,
                                  size: 30,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  {
                                    sendWhatsAppMessage(
                                        phone: service.get('phone'),
                                        message: '');
                                  }
                                }),
                        ],
                      ),
                    ),
                  // IconButton(
                  //     icon: const Icon(
                  //       Icons.whatsapp,
                  //       size: 30,
                  //     ),
                  //     color: Colors.green.shade800,
                  //     onPressed: () {
                  //       {
                  //         sendWhatsAppMessage(
                  //             phone: service.get('phone'),
                  //             message: '');
                  //       }
                  //     }),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final httpsUri = Uri(
                        scheme: "https",
                        path: (service.get('link')),
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
                    label: const Text("Link"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff072948)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

