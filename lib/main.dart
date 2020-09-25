import 'package:flutter/material.dart';
import 'package:morbimirror/Screens/SearchPage.dart';
import 'package:morbimirror/Screens/Splash_Screen.dart';
import 'package:morbimirror/test.dart';
import 'Screens/Category_News.dart';
import 'Screens/Drawer_Category.dart';
import 'Screens/HomeNewsMainPage.dart';
import 'Screens/Homepage_New.dart';
import 'Screens/temp.dart';


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
      home: tempfile(),
      routes: {

      'home':(context)=>homepage(),
        'categorynews':(context)=>CategoryNews(),
        'Homenewspagemain':(context)=>Newsmainpage(),
        'search':(context)=>searching(),
        'drawer_category':(context)=>News_category_drawer()


      },
    );
  }
}


