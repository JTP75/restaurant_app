import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/backend.dart';
import 'package:restaurant_app/backend/restaurant_service.dart';


class RestaurantPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  Restaurant restaurant = restaurantService.results[searchPage.selectedIndex];

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}