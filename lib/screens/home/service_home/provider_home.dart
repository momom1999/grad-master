import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:grad/DatabaseUtils/storage_services.dart';
import 'package:grad/base.dart';
import 'package:grad/model/service_provider_categories.dart';
import 'package:grad/screens/home/service_home/provider_navigator.dart';
import 'package:grad/screens/home/service_home/provider_view_model.dart';
import 'package:grad/screens/home/service_home/thanks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class ProviderHomeScreen extends StatefulWidget {
  static const String routeName = 'providerHomeScreen';

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState
    extends BaseView<ProviderHomeScreen, ProviderHomeViewModel>
    implements ProviderHomeNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var linkController = TextEditingController();
  var phoneController = TextEditingController();
  var categories = ServiceProviderCategories.getCategories();

  String? imageURL = null;
  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  late ServiceProviderCategories selectedcategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    selectedcategory = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Form(
          key: formKey,
          child: Stack(children: [
            Scaffold(
                appBar: AppBar(
                  title: Text('Paws'),
                  centerTitle: true,
                ),
                body: Stack(children: <Widget>[
                  Container(
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
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: titleController,
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
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
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
                                  textInputAction: TextInputAction.newline,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 40.0,
                                    ),
                                    hintText: 'Description',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                  ),
                                  maxLines: 10,
                                  minLines: 3,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: linkController,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Please Enter Your Link";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: 'Link',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Please Enter Your Phone";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: 'Phone',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                        BorderSide(color: Color(0xFF000A32))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButton<ServiceProviderCategories>(
                                  value: selectedcategory,
                                  items: categories
                                      .map((cat) =>
                                      DropdownMenuItem<ServiceProviderCategories>(
                                          value: cat,
                                          child: Row(
                                            children: [Text(cat.name)],
                                          )))
                                      .toList(),
                                  onChanged: (category) {
                                    if (category == null) {
                                      return;
                                    } else {
                                      selectedcategory = category;
                                    }
                                    setState(() {});
                                  },
                                ),

                                TextButton(
                                  onPressed: () async {
                                    final results = await FilePicker.platform.pickFiles(
                                      allowMultiple: false,
                                      type: FileType.custom,
                                      allowedExtensions: ['png', 'jpg'],
                                    );

                                    if (results == null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('No Image Selected'),
                                        ),
                                      );

                                      return null;
                                    }

                                    final path = results.files.single.path!;
                                    final fileName = results.files.single.name;
                                    imageURL = results.files.first.path;
                                    final bytes=File(_image!.path).readAsBytesSync();
                                    String img64=base64Encode(bytes);
                                    storage
                                        .uploadFile(path, fileName)
                                        .then((value) => print('Done'));
                                    setState(() {
                                      imageURL=img64;
                                    });
                                  },
                                  child: Text('Add Image'),
                                  style: TextButton.styleFrom(
                                      primary: Color(0xFF000A32),
                                      textStyle:
                                      TextStyle(fontSize: 15, color: Colors.white),
                                      alignment: Alignment.bottomLeft),
                                ),
                                imageURL != null
                                    ? Image.file(File(imageURL!))
                                    : Container(),
                                SizedBox(
                                  height: 180,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, Thanks.routeName);

                                      ValidateForm();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF000A32)),
                                    child: Text(
                                      'Update',
                                      style:
                                      TextStyle(fontSize: 18, color: Colors.white),
                                    )),
                              ],
                            ))),
                  )
                ])),
          ])),
    );
  }

  void ValidateForm() {
    if (formKey.currentState!.validate()) {
      viewModel.AddUptadesToDB(
        titleController.text,
        descriptionController.text,
        selectedcategory.id,
        linkController.text,
        phoneController.text,
        imageURL!,
      );
    }
  }

  @override
  ProviderHomeViewModel initViewModel() {
    return ProviderHomeViewModel();
  }

  @override
  void CatogoryCreated() {
    // TODO: implement CatogoryCreated
    Navigator.pop(context);
  }
}