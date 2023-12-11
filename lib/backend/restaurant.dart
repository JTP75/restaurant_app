/// Backend class containing restaurant information
class Restaurant {
  
  String name = "";
  String url = "";
  String phoneNumber = "";

  Restaurant(String? name) {
    name = name!;
    url = "https://restaurant.com";
    phoneNumber = "(412) 382-5968";
  }
}