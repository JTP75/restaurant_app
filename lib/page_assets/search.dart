import 'package:flutter/material.dart';

/// Responsible for managing restaurant search box
class SearchBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchBoxState();
}

/// Responsible for managing restaurant search box state
class SearchBoxState extends State<SearchBox> {
  String searchTerm = "";
  String searchTermEnter = "";

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: (value) {
        setState(() {
          searchTerm = value;
        });
      },
      onSubmitted: (value) {
        setState(() {
          searchTermEnter = value;
        });
      },
      hintText: "Enter search term...",
    );
  }
}