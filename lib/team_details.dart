import 'package:fetchuser/team_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamDetails extends StatelessWidget {
  final String description;

  final String photo;
  final String title;

  TeamDetails({this.description, this.photo,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[

              Image.network(photo,width: 200,),

              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(description)),
            ],
          ),
        ],
      ),
    );
  }
}
