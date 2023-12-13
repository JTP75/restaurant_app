import 'package:restaurant_app/backend/restaurant_service.dart';

const List<String> priceRangeEntries = ["Any","\$","\$\$","\$\$\$"];
const List<String> foodTypeEntries = [
  "Any",
  "Breakfast",
  "Pizza",
  "Mexican",
  "Burgers",
  "Chinese",
  "Sandwiches",
  "Seafood",
  "Thai",
  "Italian",
  "Korean",
  "Japanese",
  "Steakhouses",
  "Vietnamese",
  "Vegetarian",
  "Sushi Bars",
  "American"
];
const List<int> travelDistanceEntries = [1,5,10,25,-1];

class HomePageBackend {
  String priceRange = "Any";
  String foodType = "Any";
  DietaryRestrictions dietaryRestrictions = DietaryRestrictions();
  int maxDistanceMiles = 10;

  HomePageBackend() {
    priceRange = "Any";
    foodType = "Any";
    dietaryRestrictions = DietaryRestrictions();

    print(dietaryRestrictions);
  }
}

class DietaryRestrictions {
  bool glutenFree = false;
  bool halal = false;
  bool keto = false;
  bool kosher = false;
  bool pescatarian = false;
  bool vegetarian = false;
  bool vegan = false;

  DietaryRestrictions() {
    glutenFree = false;
    halal = false;
    keto = false;
    kosher = false;
    pescatarian = false;
    vegetarian = false;
    vegan = false;
  }
}

class SettingsPageBackend {
  bool manualLocation = false;
  String address = "";

  SettingsPageBackend() {
    manualLocation = false;
    address = "";
  }
}

// Instances //
RestaurantService restaurantService = RestaurantService().loadAccessToken();
// LocationService locationService = LocationService();
HomePageBackend homePage = HomePageBackend();
SettingsPageBackend settingsPage = SettingsPageBackend();