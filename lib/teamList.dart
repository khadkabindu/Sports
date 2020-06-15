import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {

  final String apiUrl = 'https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=Arsenal';

  Future<List<dynamic>> fetchTeams() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['teams'];
  }

  String _teamName(dynamic user) {
    return user['strTeam'];
  }

  String _location(dynamic user) {
    return user['strCountry'];
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: FutureBuilder<List<dynamic>>(
        future: fetchTeams(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(_teamName(snapshot.data[0]));
            return ListView.builder(
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
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
