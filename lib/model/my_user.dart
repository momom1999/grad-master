import 'dart:convert';

class MyUser{
  static const String COLLECTION_NAME="Users";
  String id;
  String fNAme;
  String lName;
  String email;

  MyUser({required this.id,required this.fNAme,
    required this.lName,required this.email});

  MyUser.fromJason(Map<  String,dynamic>json):this(
  id: json["id"],
  fNAme: json["fName"],
  lName: json["lName"],
  email: json["email"],
  );

  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "fName":fNAme,
      "lName":lName,
      "email":email
    };

  }
}