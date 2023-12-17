import 'dart:math';

import 'package:restaurant_app/backend/restaurant_service.dart';
import 'package:restaurant_app/backend/location_service.dart';

RestaurantService restaurantService = RestaurantService().loadAccessToken();
LocationService locationService = LocationService().loadAccessToken();
final random = Random();

const List<String> priceRangeEntries = ["Any","\$","\$\$","\$\$\$","\$\$\$\$"];
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
const List<int> travelDistanceEntries = [1,5,10,25];
const Map<String,String> priceMap = {
  "\$": "1",
  "\$\$": "1,2",
  "\$\$\$": "1,2,3",
  "\$\$\$\$": "1,2,3,4",
  "Any": "1,2,3,4"
};

class HomePageBackend {
  String priceRange = "Any";
  String foodType = "Any";
  int maxDistanceMiles = 10;

  HomePageBackend() {
    priceRange = "Any";
    foodType = "Any";
  }

  Map<String,String> _buildSearchParams() {
    

    Map<String,String> params = {
      "limit": "50",
      "sort_by": "distance",
      "device_platfrom": "ios",
      "term": foodType,
      "categories": "food",
      "open_now": "false",
      "price": priceMap[priceRange]!,
      "radius": "${maxDistanceMiles*1600}",
    };

    if (settingsPage.manualLocation) {
      params["location"] = settingsPage.address;
    } else {
      params["latitude"] = "${settingsPage.lat}";
      params["longitude"] = "${settingsPage.long}";
    }

    return params;
  }

  Future<Restaurant> chooseRestaurant() async {
    var params = _buildSearchParams();
    await restaurantService.search(params);
    return restaurantService.results[random.nextInt(restaurantService.results.length)];
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
    _address = "";
    manualLocation = false;
  }

  set manualLocation(bool mode) {
    _manualLocation = mode;
    if (!_manualLocation) {
      lat = _locationService.latitude;
      long = _locationService.longitude;
    }
  }

  bool get manualLocation => _manualLocation;

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