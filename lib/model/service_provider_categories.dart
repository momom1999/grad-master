class ServiceProviderCategories{
  static String clinicId="clinic";
  static String storeId="store";
  static String shelterId="shelter";

 String id;
late String name;

ServiceProviderCategories(this.id,this.name);
ServiceProviderCategories.fromId(this.id){
  name=id;

}
static List<ServiceProviderCategories>  getCategories(){
  return[
    ServiceProviderCategories.fromId(clinicId),
    ServiceProviderCategories.fromId(storeId),
    ServiceProviderCategories.fromId(shelterId),
  ];

}

}