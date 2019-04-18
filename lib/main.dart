import 'package:flutter/material.dart';
import 'package:washrequest/homePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

  theme: ThemeData(
    // Define the default Brightness and Colors
    brightness: Brightness.light,
    primaryColor: Colors.greenAccent,
    accentColor: Colors.cyan[600],
    
    // Define the default Font Family
    fontFamily: 'Montserrat',
    
    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  ),
  home: FindCarwash(),
  debugShowCheckedModeBanner: false,
    );
  }
  
}