import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grad/base.dart';
import 'package:grad/model/service_provider_categories.dart';
import 'package:grad/screens/home/service_home/provider_navigator.dart';
import 'package:grad/screens/home/service_home/provider_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProviderHomeScreen extends StatefulWidget {
  static const String routeName = 'providerHomeScreen';






  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState
    extends BaseView<ProviderHomeScreen, ProviderHomeViewModel>
    implements ProviderHomeNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();

  var categories=ServiceProviderCategories.getCategories();
late ServiceProviderCategories selectedcategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    selectedcategory=categories[0];
  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) =>viewModel,
      child: Form(
        key: formKey,
          child: Stack(children: [
        Scaffold(
            appBar: AppBar(
              title: Text('Paws'),
              centerTitle: true,
            ),
            body: new Stack(children: <Widget>[

              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller:titleController,
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
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                        ),
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF000A32))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF000A32))),
                      ),
                      maxLines: 10,
                      minLines: 3,
                    ),
                    SizedBox(height: 10,),
                    
                    DropdownButton<ServiceProviderCategories>
                      (value: selectedcategory,
                      items: categories.map((cat) =>
                        DropdownMenuItem<ServiceProviderCategories>
                      (value: cat,
                            child: Row(children: [
                        Text(cat.name)
                    ],))).toList(), onChanged: (category){
                        if (category==null){
                          return;
                        }else{
                        selectedcategory=category;
                    }
                        setState(() {

                        });
                        },),
                    
                    ElevatedButton(
                      onPressed: (){
                        ValidateForm();
                        },
                       child: Text('Update')),

                  ],
                ))),
              )
            ])),
      ])),
    );
  }

  void ValidateForm(){
    if(formKey.currentState!.validate()){
      viewModel.AddUptadesToDB(
          titleController.text,
          descriptionController.text,
          selectedcategory.id);
  }}

  @override
  ProviderHomeViewModel initViewModel() {
    return ProviderHomeViewModel();
  }
}
