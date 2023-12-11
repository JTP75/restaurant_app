import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'package:restaurant_app/page_assets/home.dart';
import 'package:restaurant_app/page_assets/search.dart';
import 'package:restaurant_app/page_assets/settings.dart';

const double topInset = 40;
const double bottomInset = 30;


void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

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
                // Handle home button press
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
              onPressed: () {
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
              onPressed: () {
              },
            ),
          ],
        ),
      ),

    );
  }
}
