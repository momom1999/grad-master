import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHome extends StatefulWidget {
  static const String routeName='providerHome';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {


  @override
  Widget build(BuildContext context) {
    return Form(

        child: Stack(
          children: [
        Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.teal,
          title: Text('Vezeeta'),
          centerTitle: true,
        ),
        body: Padding(
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
    borderSide: BorderSide(color: Colors.teal)),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.teal)),
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
    borderSide: BorderSide(color: Colors.teal)),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.teal)),
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
              borderSide: BorderSide(color: Colors.teal)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.teal)),
        ),
      ),



    SizedBox(
    height: 5,
    ),
  ],
    )
    )


    ),
        )
        ),
    ]    )









    );






  }
    }


