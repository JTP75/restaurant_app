import 'package:flutter/material.dart';

const List<String> priceRangeEntries = ["\$","\$\$","\$\$\$"];
//const List<String> priceRangeEntries = ["hello"];

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
            child: Text(
              "Options",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
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
                    MyDropdownButton()
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

class MyDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyDropdownButtonState();

}

class MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedValue = priceRangeEntries.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
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