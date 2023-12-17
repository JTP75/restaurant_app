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