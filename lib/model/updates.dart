class Updates {
  static const String COLLECTION_NAME = "Updates";

  String id;
  String title;
  String description;
  String catId;
  String link;
  String phone;
  String? imageURL;

  Updates(
      {this.id = "",
      required this.title,
      required this.description,
      required this.catId,
      required this.link,
      required this.phone,
      this.imageURL = null});

  Updates.fromJson(Map<String, dynamic> jason)
      : this(
          id: jason["id"],
          title: jason["title"],
          description: jason["description"],
          catId: jason["catId"],
          link: jason["link"],
          phone: jason["phone"],
          imageURL: jason["imageURL"],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'catId': catId,
      'link': link,
      'phone': phone,
      'imageURL': imageURL,
    };
  }
}
