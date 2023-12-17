import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:restaurant_app/page_assets/business_page.dart';

import 'package:restaurant_app/backend/backend.dart' as backend;

const yelpLink = "https://www.yelp.com/";



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
      height: 657.0,
      child: Column(
        children: [
          SizedBox(height:10),
          CupertinoSearchTextField(
            onSubmitted: (value) async {
              await backend.locationService.updateLocation();
              setState(() {
                searchTerm = value;
              });
              _updateSearchResults();
            },
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(yelpLink));
                },
                child: Image.asset(
                  "assets/yelp_logo.png",
                  scale: 18,
                ),
              ),
            ]
          ),
          Divider(thickness: 3,),
          Expanded(
            child: _buildSearchResults(searchTerm),
          ),
        ]
      )
    );
  }

  void _updateSearchResults() async {
    await restaurantService.search(_buildSearchParams());
    setState(() {});
  }

  Map<String,String> _buildSearchParams() {
    Map<String,String> params = {
      "limit": "50",
      "sort_by": "distance",
      "device_platfrom": "ios",
      "categories": "food",
      "open_now": "false",
      "term": searchTerm,
      "radius": "40000",
    };

    if (backend.settingsPage.manualLocation) {
      params["location"] = backend.settingsPage.address;
    } else {
      params["latitude"] = "${backend.settingsPage.lat}";
      params["longitude"] = "${backend.settingsPage.long}";
    }

    return params;
  }

  Widget _buildSearchResults(String? query) {
    if (restaurantService.results.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Results Found",
            style: TextStyle(
              color: Color.fromARGB(255, 128, 128, 128),
            )
          ),
        ],
      );
    }
    var count = 0;
    if (restaurantService.resultCount!=0) {
      count = restaurantService.results.length*2-2;
    }
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context,index) {
        if (index>=restaurantService.results.length) {
          return SizedBox(height:0,width:0);
        } else if (index.isEven) {
          return InkWell(
            onTap: () {
              backend.searchPage.selectedIndex = index;
              showDialog(
                context: context,
                builder: (context) {
                  return RestaurantPage(restaurant: restaurantService.results[index]);
                }
              );
            }, 
            child: ListTile(
              title: Text(restaurantService.results[index].name),
              leading: Text("${(restaurantService.results[index].distance*0.000621371).toStringAsFixed(1)}mi"),
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
                  Text(restaurantService.results[index].price),
                  Spacer(flex:1),
                  Text(restaurantService.results[index].isClosed ? 'Closed':'Open')
                ]
              ),
            )
          );
        } else {
          return Divider(color: Color.fromARGB(128, 65, 65, 65));
        }
      },
    );
  }
}