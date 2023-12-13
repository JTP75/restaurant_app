import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/backend.dart' as backend;

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
                    Text("Price Range"),
                    Spacer(flex:1,),
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
                    Text("Food Category"),
                    Spacer(flex: 1),
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
                    Text("Dietary Restrictions"),
                    Spacer(flex: 1),
                    DietaryRestrictionsButton()
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
                    Text("Travel Distance"),
                    Spacer(flex: 1),
                    TravelDistanceDropdown()
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
  String selectedValue = backend.homePage.priceRange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        backend.homePage.priceRange = newValue!;
      },
      items: backend.priceRangeEntries.map<DropdownMenuItem<String>>(
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
  String selectedValue = backend.homePage.foodType;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        backend.homePage.foodType = newValue!;
      },
      items: backend.foodTypeEntries.map<DropdownMenuItem<String>>(
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

  backend.DietaryRestrictions dr = backend.homePage.dietaryRestrictions;

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
              backend.homePage.dietaryRestrictions.glutenFree = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Halal"),
            value: dr.halal, 
            onChanged: (value) {
              setState (() {
                dr.halal = value!;
              });
              backend.homePage.dietaryRestrictions.halal = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Keto"),
            value: dr.keto, 
            onChanged: (value) {
              setState (() {
                dr.keto = value!;
              });
              backend.homePage.dietaryRestrictions.keto = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Kosher"),
            value: dr.kosher, 
            onChanged: (value) {
              setState (() {
                dr.kosher = value!;
              });
              backend.homePage.dietaryRestrictions.kosher = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Pescatarian"),
            value: dr.pescatarian, 
            onChanged: (value) {
              setState (() {
                dr.pescatarian = value!;
              });
              backend.homePage.dietaryRestrictions.pescatarian = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Vegetarian"),
            value: dr.vegetarian, 
            onChanged: (value) {
              setState (() {
                dr.vegetarian = value!;
              });
              backend.homePage.dietaryRestrictions.vegetarian = value!;
            }
          ),
          CheckboxListTile(
            title: Text("Vegan"),
            value: dr.vegan, 
            onChanged: (value) {
              setState (() {
                dr.vegan = value!;
              });
              backend.homePage.dietaryRestrictions.vegan = value!;
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
  int selectedValue = backend.homePage.maxDistanceMiles;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedValue,
      onChanged: (int? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
        backend.homePage.maxDistanceMiles = newValue!;
      },
      items: backend.travelDistanceEntries.map<DropdownMenuItem<int>>(
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