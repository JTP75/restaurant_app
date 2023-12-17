import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/restaurant_service.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantPage({required this.restaurant});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => RestaurantPageState(restaurant: restaurant);
}

class RestaurantPageState extends State<RestaurantPage> {
  Restaurant restaurant;

  RestaurantPageState({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    String categories = restaurant.categories.map((e)=>e["title"]).join(", ");

    int prev = 0;
    int offset = 0;
    for (var i=0; i<categories.length; i++) {
      if (categories[i]==",") {
        prev = i;
        if (i-offset>20) {
          categories = "${categories.substring(0,prev+2)}\n${categories.substring(prev+2)}";
          offset += 20;
        }
      }
    }

    return Dialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      insetAnimationCurve: Curves.bounceIn,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  restaurant.name.length>32? 
                    "${restaurant.name.substring(0,32)}\n${restaurant.name.substring(32)}" : 
                    restaurant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Spacer(flex:1),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  icon: Icon(Icons.close_outlined),
                ),
              ]
            ),
            Image.network(
              restaurant.imageUrl,
              scale:5
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top:10,bottom:10),
              child: Row(
                children: [
                  Text(
                    restaurant.displayAddress.map<String>((e) => e).join("\n"),
                    softWrap: true,
                  ),
                  Spacer(flex:1),
                  Text(
                    "${(restaurant.distance*0.000621371).toStringAsFixed(1)}mi"
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,bottom:10),
              child: Row(
                children: [
                  Text(
                    restaurant.isClosed? "Closed" : "Open"
                  ),
                  Spacer(flex:1),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("tel:${restaurant.phone}"));
                    },
                    child: Text(
                      restaurant.displayPhone,
                      style: TextStyle(
                        color: Colors.blue,
                      )
                    )
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,bottom:10),
              child: Row(
                children: [
                  Text(
                    categories
                  ),
                  Spacer(flex:1),
                  Text(
                    restaurant.price
                  )
                ]
              ),
            ),
            Spacer(flex:1),
            Link(
              uri: Uri.parse(restaurant.url), 
              builder: (context, launch) {
                return ElevatedButton(
                  onPressed: launch, 
                  child: Text("Read more on Yelp")
                );
              }
            )
          ],
        ),
      ),
    );
  }
}