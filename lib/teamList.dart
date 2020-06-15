import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamList extends StatefulWidget {
  String category;

  TeamList({this.category});

  _TeamListState createState() {
    return _TeamListState(category: category);
  }
}

class _TeamListState extends State<TeamList> {
  String category;

  _TeamListState({this.category});

  Future<List<dynamic>> fetchTeams() async {
    print("i am category $category");
    var result;
    try {
      result = await http.get(
          "https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=${widget.category}");
      return json.decode(result.body)['teams'];
    } catch (e) {
      print(e);
    }
  }

  String _teamName(dynamic user) {
    return user['strTeam'];
  }

  String _location(dynamic user) {
    return user['strCountry'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: fetchTeams(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Text("No Teams found"),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  snapshot.data[index]['strTeamBadge'])),
                          title: Text(_teamName(snapshot.data[index])),
                          subtitle: Text(_location(snapshot.data[index])),
                        )
                      ],
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
