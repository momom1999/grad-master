import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';





class ProviderHome extends StatefulWidget {
  static const String routeName='providerHome';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
File?image;
  Future pickImage()async{
    final image= await ImagePicker().pickImage(source: ImageSource.gallery);








    if(image==null)return;
    final imageTemporary= File(image.path);
    this.image=imageTemporary;
  }
  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Form(

        child: Stack(
          children: [
        Scaffold(
        appBar: AppBar(
          title: Text('Paws'),
          centerTitle: true,
        ),
        body:

        new Stack(
        children: <Widget>[
        new Container(
        decoration: new BoxDecoration(
        image: new DecorationImage(image: new AssetImage("assets/images/background.png"), fit: BoxFit.cover,),
        ),),

        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Form(
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(
    height: 30,
    ),
    Text(
    'Update Data',
    style: TextStyle(
    fontSize: 17, fontWeight: FontWeight.w500),
    ),
    SizedBox(
    height: 30,
    ),
    TextFormField(
    validator: (text) {
    if (text!.trim() == "") {
    return "Please Enter Title";
    }
    return null;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(

    hintText: 'Title',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0xFF000A32))),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0xFF000A32))),
    ),
    ),
    SizedBox(
    height: 5,
    ),
    TextFormField(
      keyboardType: TextInputType.multiline,



      validator: (text) {
    if (text!.trim() == "") {
    return "Please Enter Description";
    }
    return null;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(


      contentPadding: const EdgeInsets.symmetric(vertical: 40.0, ),
    hintText: 'Description',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0xFF000A32))),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Color(0xFF000A32))),
    ),  maxLines: 10,
      minLines: 3,
    ),

      SizedBox(
        height: 10,
      ),

      TextFormField(
        validator: (text) {
          if (text!.trim() == "") {
            return "Please Insert Image";
          }
          return null;
        },

        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Image',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFF000A32))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFF000A32))),

        ),
      ),TextButton(
          onPressed: () { _picker.pickImage(source: ImageSource.gallery);
          },style: ElevatedButton.styleFrom(primary: Color(0xFF000A32)),
          child: Text(
            'Pick Image',
            style: TextStyle(color: Colors.white,
              fontSize: 15,
            ),
          )
      ),



    SizedBox(
    height: 5,
    ),
  ],
    )
    )


    ),
        )
  ]
      )  ),
    ]    )









    );






  }
    }


