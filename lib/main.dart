import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> countries;

  Future<List> getCountries() async {
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "hola",
        home: Scaffold(
          appBar: AppBar(
            title: Text("All Countries in the world"),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: ListView(
              children: <Widget>[
                FutureBuilder<List>(
                  future: countries,
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: List.generate(snapshot.data.length, (ind) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        details(snapshot.data[ind]))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    color: Colors.red,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3.0
                                    )]
                                  ),
                                  width: 400.0,
                                  child: Text(
                                    snapshot.data[ind]['name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                      letterSpacing: 2.0,
                                      wordSpacing: 2.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
