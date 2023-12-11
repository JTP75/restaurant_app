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