import 'package:fetchuser/search_widget.dart';
import 'package:fetchuser/team_details.dart';
import 'package:fetchuser/team_list.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String searchedItem;

  onItemChanged(String newSearched) {
    setState(() {
      this.searchedItem = newSearched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SearchWidget(),
      ),
    );
  }
}


