import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/backend.dart' as backend;



class SearchResults extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchResultsState();
}

class SearchResultsState extends State<SearchResults> {
  String searchTerm = "";
  var restaurantService = backend.restaurantService;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.0,
      child: Column(
        children: [
          SearchBar(
            onSubmitted: (value) {
              setState(() {
                searchTerm = value;
              });
              _updateSearchResults();
            },
            hintText: "Enter search term...",
          ),
          SizedBox(height:10),
          Expanded(
            child: _buildSearchResults(searchTerm),
          ),
        ]
      )
    );
  }

  void _updateSearchResults() async {
    await restaurantService.search(_buildSearchParams());
    setState(() {}); // Update the state to trigger a rebuild with the new search results
  }

  Map<String,String> _buildSearchParams() {
    return {
      "location": "Pittsburgh", // TODO
      "term": searchTerm,
      "limit": "50",
      "sort_by": "best_match",
      "device_platfrom": "ios",
      "radius": "40000", // TODO
      "categories": "food" // TODO
    };
  }

  Widget _buildSearchResults(String? query) {
    print("BSR CALLED ============================");
    var count = 0;
    if (restaurantService.resultCount!=0) {
      count = restaurantService.resultCount*2-2;
    }
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context,index) {
        if (index>=restaurantService.results.length) {

          return SizedBox(height:0,width:0);

        } else if (index.isEven) {

          //print("$index / ${restaurantService.results.length}");

          return ListTile(
            title: Text(restaurantService.results[index].name),
            leading: Text("leading"),
            subtitle: Text(
              restaurantService.results[index].categories
                .map((map) => map["title"])
                .join(", "),
              style: TextStyle(
                fontSize: 10
              )
            ),
            trailing: Column(
              children: [
                Text("Trailing"),
                Spacer(flex:1),
                Text(restaurantService.results[index].isClosed ? 'Closed':'Open')
              ]
            ),
          );

        } else {

          return Divider(color: Color.fromARGB(128, 65, 65, 65));

        }
      },
      shrinkWrap: true,
    );
  }
}