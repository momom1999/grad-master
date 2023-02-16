class SupplierProvider{
  String id;
  String title;
  String description;
  String image;
SupplierProvider({
    required this.id,required this.title,required this.description,required this.image
});
SupplierProvider.fromFireStore(Map<String,dynamic>data):
    this(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      image: data['image']

    );
Map<String,dynamic>toFireStore(){
  return{
    'id':id,
    'title':title,
    'description':description,
    'image':image,
  };
}
}