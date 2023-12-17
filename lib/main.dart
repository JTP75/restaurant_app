import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'package:restaurant_app/page_assets/home.dart';
import 'package:restaurant_app/page_assets/search.dart';
import 'package:restaurant_app/page_assets/settings.dart';
import 'package:restaurant_app/page_assets/business_page.dart';

import 'package:restaurant_app/backend/backend.dart';

const double topInset = 40;
const double bottomInset = 30;


void main() {
  locationService.updateLocation();
  return runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ));
}

/// Top level for full application
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  AppWidgetState createState() => AppWidgetState();
}

/// App state as notifier
class AppState extends ChangeNotifier {
  void updateState() {
    print("changing state");
    notifyListeners();
  }
}

/// App state 
class AppWidgetState extends State<MyApp> {
  AppState state = AppState();  

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomePage(),
      ),
    );

  }
}

/// Home page frontend
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Search options",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              children: [CriteriaBox()]
            ),
            Spacer(flex:1),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () async {
                  var restaurant = await homePage.chooseRestaurant();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return RestaurantPage(restaurant: restaurant);
                    }
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get a Random Restaurant",
                            style: TextStyle(
                              fontSize: 25
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
              )
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color.fromARGB(64, 255, 87, 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage())
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}

/// Search page frontend
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Search"),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: SearchResults(),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color.fromARGB(64, 255, 87, 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage())
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}

/// Settings page frontend
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ManualLocationSetting()
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color.fromARGB(64, 255, 87, 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),

    );
  }
}
