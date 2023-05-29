import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;

  var picker = ImagePicker();

  Future getImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Future uploadImage() async {
  //   var request = http.MultipartRequest('POST', Uri.parse('YOUR_API_ENDPOINT'));

  //   request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('Image uploaded successfully');
  //   } else {
  //     print('Image upload failed');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
