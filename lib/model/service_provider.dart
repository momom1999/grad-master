import 'dart:convert';


class ServiceProvider{
  static const String COLLECTION_NAME="ServiceProviderUser";
  String id;
  String Name;
  String email;

  ServiceProvider({required this.id,required this.Name,
    required this.email});

  ServiceProvider.fromJason(Map<  String,dynamic>json):this(
    id: json["id"],
    Name: json["Name"],
    email: json["email"],
  );

  Map<String,dynamic>toJson(){
    return{
      "id":id,
      " Name":Name,
      "email":email
    };

  }
}