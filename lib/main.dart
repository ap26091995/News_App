import 'package:flutter/material.dart';
import 'package:morbimirror/Screens/SearchPage.dart';
import 'package:morbimirror/Screens/Splash_Screen.dart';

import 'HomePage.dart';
import 'Screens/Category_News.dart';
import 'Screens/HomeNewsMainPage.dart';
import 'Screens/Homepage_New.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashscreen(),
      routes: {

      'home':(context)=>homepage(),
        'categorynews':(context)=>CategoryNews(),
        'Homenewspagemain':(context)=>Newsmainpage(),
        'search':(context)=>searching(),


      },
    );
  }
}


