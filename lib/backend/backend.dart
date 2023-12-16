import 'package:restaurant_app/backend/restaurant_service.dart';
import 'package:restaurant_app/backend/location_service.dart';

RestaurantService restaurantService = RestaurantService().loadAccessToken();
LocationService locationService = LocationService().loadAccessToken();

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

class SearchPageBackend {
  int _selectedIndex = -1;
  void resetIndex() {
    _selectedIndex = -1;
  }
  set selectedIndex(int index) {
    _selectedIndex = index;
  }
  int get selectedIndex {
    if (_selectedIndex<0) {
      return 0;
    } else {
      return _selectedIndex;
    }
  }
}

class SettingsPageBackend {
  LocationService _locationService = locationService;

  bool _manualLocation = false;
  String _address = "";
  double lat = 0.0;
  double long = 0.0;

  SettingsPageBackend() {
    _locationService = locationService;
    _manualLocation = false;
    _address = "";
    lat = 0.0;
    long = 0.0;
  }

  set manualLocation(bool mode) {
    _manualLocation = mode;
    if (!_manualLocation) {
      lat = _locationService.latitude;
      long = _locationService.longitude;
    }
  }

  set address(String address) {
    _address = address;
  }
  String get address {
    if (_manualLocation) {
      return _address;
    } else {
      return locationService.city;
    }
  }
}

// Instances //
HomePageBackend homePage = HomePageBackend();
SearchPageBackend searchPage = SearchPageBackend();
SettingsPageBackend settingsPage = SettingsPageBackend();