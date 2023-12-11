import 'package:flutter/material.dart';
import 'package:restaurant_app/backend/restaurant.dart';



class SearchResults extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  String searchTerm = "";
  List<Restaurant> results = [
    Restaurant("Primanti Bros'"),
    Restaurant("Ocha Thai"),
    Restaurant("Prince of India")
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: Column(
        children: [
          SearchBar(
            onChanged: (value) {
              setState(() {
                searchTerm = value;
              });
            },
            hintText: "Enter search term...",
          ),
          Expanded(
            child: buildSearchResults(searchTerm),
          ),
        ]
      )
    );
  }

  Widget buildSearchResults(String? query) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context,index) {
        return ListTile(
          title: Text(results[index].name),
        );
      },
      shrinkWrap: true,
    );
  }
}