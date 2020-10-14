import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class details extends StatelessWidget {
  Map<String, dynamic> country;

  details(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
      ),
      body: ListView(
        children: <Widget>[
          SvgPicture.network(
            country['flag'],
            fit: BoxFit.fitWidth,
            height: 300.0,
            placeholderBuilder: (ctx) => LinearProgressIndicator(),
          ),
          Text("capital: " + country['capital'],
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("region: " + country['region'],
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("sub region: " + country['subregion'],
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("currency: " + country['currencies'][0]['name'],
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("population: " + country['population'].toString(),
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Language: " + country['languages'][0]['name'],
            style: TextStyle(
                fontSize: 30.0
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

