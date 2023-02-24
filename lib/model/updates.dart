

class Updates{

  static const String COLLECTION_NAME="Updates";

  String id;
  String title;
  String description;
  String catId;

  Updates({
     this.id="",required this.title,
    required this.description,required this.catId
  });
  Updates.fromJson(Map<String,dynamic>jason):this(
      id:jason["id"],
      title:jason["title"],
      description:jason["description"],
      catId:jason["catId"]

  );
  Map<String,dynamic>toJson(){
    return{
  'id':id,
  'title':title,
  'description':description,
  'catId':catId,
  };
}
}