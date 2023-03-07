

class Updates{

  static const String COLLECTION_NAME="Updates";

  String id;
  String title;
  String description;
  String catId;
  String imageURL;

  Updates({
     this.id="",required this.title,
    required this.description,required this.catId,required this.imageURL
  });
  Updates.fromJson(Map<String,dynamic>jason):this(
      id:jason["id"],
      title:jason["title"],
      description:jason["description"],
      catId:jason["catId"],
      imageURL: jason["imageURL"],

  );
  Map<String,dynamic>toJson(){
    return{
  'id':id,
  'title':title,
  'description':description,
  'catId':catId,
      'imageURL':imageURL

    };
}
}