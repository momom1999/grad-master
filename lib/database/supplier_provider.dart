// class ServiceUpdates{
//   String id;
//   String title;
//   String description;
//   String image;
// ServiceUpdates({
//     required this.id,required this.title,required this.description,required this.image
// });
// ServiceUpdates.fromFireStore(Map<String,dynamic>data):
//     this(
//       id: data['id'],
//       title: data['title'],
//       description: data['description'],
//       image: data['image']
//
//     );
// Map<String,dynamic>toFireStore(){
//   return{
//     'id':id,
//     'title':title,
//     'description':description,
//     'image':image,
//   };
// }
// }