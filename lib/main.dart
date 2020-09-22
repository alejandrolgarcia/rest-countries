import 'package:flutter/material.dart';
import 'package:rest_countries/src/screens/country_detail.dart';
import 'package:rest_countries/src/screens/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST Countries',
      initialRoute: 'home',
      routes: {
        'home'   : (BuildContext context) => Home(),
        'detail' : (BuildContext context) => CountryDetail()
      },
    );
  }
}