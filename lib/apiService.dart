import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService extends StatefulWidget {
  String category;

  ApiService({this.category});
  @override
  _ApiServiceState createState() => _ApiServiceState();
}

class _ApiServiceState extends State<ApiService> {

  String category;

  _ApiServiceState({this.category});

  Future<List<dynamic>> fetchTeams() async {
    var result;
    try {
      result = await http.get(
          "https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=${widget.category}");
      return json.decode(result.body)['teams'];
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  FutureBuilder<List<dynamic>>(
        future: fetchTeams(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

        },
      ),
    );
  }
}

