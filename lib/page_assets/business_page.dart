import 'package:flutter/material.dart';


class RestaurantPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Customize the appearance of your popup
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Popup Content'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Close the popup
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
  
}