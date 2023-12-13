import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dotenv/dotenv.dart';

class RestaurantService {
  static const _searchUrl = "https://api.yelp.com/v3/businesses/search";
  late String _token = "";
  late Map<String,String> _headers = {};
  
  int resultCount = 0;
  List<Restaurant> results = [];

  late http.Response response;

  RestaurantService loadAccessToken() {
    var env = DotEnv();
    env.load();
    _token = env['YELP_API_KEY']!;
    _headers = {"Authorization": "bearer $_token"};
    return this;
  }

  Future<void> search(Map<String,String> params) async {
    results.clear();

    var uri = Uri.parse(_searchUrl);
    try {
      response = await http.get(
        uri.replace(queryParameters: params),
        headers: _headers
      );
      if (response.statusCode!=200) {
        throw Exception("Exit code ${response.statusCode}\n${response.body}");
      }
    } catch (e) {
      print(e);
    }

    Map<String,dynamic> responseBody = json.decode(response.body);

    //print(responseBody["businesses"][0]["categories"]);

    responseBody["businesses"].forEach((business) {
      results.add(Restaurant.fromHttpResponse(business));
    });
    resultCount = responseBody["total"];
  } 
}

/// Backend class containing restaurant information
class Restaurant {
  
  late String id;
  late String alias;
  late String name;
  late String imageUrl;
  late bool isClosed;
  late String url;
  late List<dynamic> categories;
  late Map<String,dynamic> coordinates;
  late String price;
  late Map<String,dynamic> address;
  late List<dynamic> displayAddress;
  late String phone;
  late String displayPhone;
  late double distance;

  Restaurant({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.categories,
    required this.coordinates,
    required this.price,
    required this.address,
    required this.displayAddress,
    required this.phone,
    required this.displayPhone,
    required this.distance
  });

  factory Restaurant.fromHttpResponse(Map<String,dynamic> business) {
    return Restaurant(
      id: business["id"],
      alias: business["alias"],
      name: business["name"],
      imageUrl: business["image_url"],
      isClosed: business["is_closed"],
      url: business["url"],
      categories: business["categories"],
      coordinates: business["coordinates"],
      price: business["price"] as String? ?? "",
      address: business["location"],
      displayAddress: business["location"]["display_address"],
      phone: business["phone"],
      displayPhone: business["display_phone"],
      distance: business["distance"],
    );
  }
}

void main() async {
  var rs = RestaurantService();
  var params = {
    "location": "Pittsburgh",
    "term": "thai",
    "pricing_filter": "1, 2",
    "sort_by": "rating"
  };

  rs.search(params);
}

