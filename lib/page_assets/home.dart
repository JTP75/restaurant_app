import 'package:flutter/material.dart';
import 'package:restaurant_app/page_assets/home_backend.dart';

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
const List<int> travelDistanceEntries = [1,5,10,20,-1];

HomePageBackend homePageBackend = HomePageBackend();

class CriteriaBox extends Card {

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Price Range"
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    PriceDropdown()
                  ],
                ),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Food Category"
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    FoodDropdown()
                  ],
                ),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Dietary Restrictions"
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    DietaryRestrictionsButton(
                    )
                  ],
                ),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Travel Distance"
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    TravelDistanceDropdown(
                    )
                  ],
                ),
              ]
            )
          ),
        ],
      ),
    );
  }

}

class PriceDropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PriceDropdownState();

}

class PriceDropdownState extends State<PriceDropdown> {
  String selectedValue = homePageBackend.priceRange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        homePageBackend.priceRange = newValue!;
      },
      items: priceRangeEntries.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }
      ).toList(),
    );
  }
}

class FoodDropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FoodDropdownState();

}

class FoodDropdownState extends State<FoodDropdown> {
  String selectedValue = homePageBackend.foodType;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        homePageBackend.foodType = newValue!;
      },
      items: foodTypeEntries.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }
      ).toList(),
    );
  }
}

class DietaryRestrictionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DietaryRestrictionsDialog();
          },
        );
      },
      child: Text("Edit"),
    );
  }
}
class DietaryRestrictionsDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DietaryRestrictionsDialogState();
}

class DietaryRestrictionsDialogState extends State<DietaryRestrictionsDialog> {

  DietaryRestrictions dr = homePageBackend.dietaryRestrictions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dietary Restrictions'),
      content: Column(
        children: [
          CheckboxListTile(
            title: Text("Gluten-free"),
            value: dr.glutenFree, 
            onChanged: (value) {
              setState (() {
                dr.glutenFree = value!;
              });
              homePageBackend.dietaryRestrictions.glutenFree = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Halal"),
            value: dr.halal, 
            onChanged: (value) {
              setState (() {
                dr.halal = value!;
              });
              homePageBackend.dietaryRestrictions.halal = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Keto"),
            value: dr.keto, 
            onChanged: (value) {
              setState (() {
                dr.keto = value!;
              });
              homePageBackend.dietaryRestrictions.keto = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Kosher"),
            value: dr.kosher, 
            onChanged: (value) {
              setState (() {
                dr.kosher = value!;
              });
              homePageBackend.dietaryRestrictions.kosher = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Pescatarian"),
            value: dr.pescatarian, 
            onChanged: (value) {
              setState (() {
                dr.pescatarian = value!;
              });
              homePageBackend.dietaryRestrictions.pescatarian = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Vegetarian"),
            value: dr.vegetarian, 
            onChanged: (value) {
              setState (() {
                dr.vegetarian = value!;
              });
              homePageBackend.dietaryRestrictions.vegetarian = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Vegan"),
            value: dr.vegan, 
            onChanged: (value) {
              setState (() {
                dr.vegan = value!;
              });
              homePageBackend.dietaryRestrictions.vegan = value!;
            }
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

class TravelDistanceDropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TravelDistanceDropdownState();
}

String travelDistanceDisplay(int distance) {
  if (distance>0) {
    return "Within $distance miles";
  } else {
    return "Any distance";
  }
}

class TravelDistanceDropdownState extends State<TravelDistanceDropdown> {
  int selectedValue = homePageBackend.maxDistanceMiles;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedValue,
      onChanged: (int? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        homePageBackend.maxDistanceMiles = newValue!;
      },
      items: travelDistanceEntries.map<DropdownMenuItem<int>>(
        (int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(travelDistanceDisplay(value))
          );
        }
      ).toList(),
    );
  }
}